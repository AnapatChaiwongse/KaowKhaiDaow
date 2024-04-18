import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:application/navigator.dart';
import 'package:holiday_event_api/holiday_event_api.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final HolidayEventApi _holidayEventApi;

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int _currentIndex = 1;
  int _monthIndex = DateTime.now().month - 1;

  List<Map<String, dynamic>> taskData = [];

  List<List<Color>> getMonthlyGradients() {
    return [
      // January
      [const Color.fromARGB(255, 199, 244, 252), const Color.fromARGB(255, 213, 253, 212)],
      // February
      [const Color.fromARGB(255, 255, 206, 255), const Color.fromARGB(255, 208, 248, 253)],
      // March
      [const Color.fromARGB(255, 239, 255, 195), const Color.fromARGB(255, 200, 255, 203)],
      // April
      [const Color.fromARGB(255, 255, 252, 225), const Color.fromARGB(255, 255, 209, 255)],
      // May
      [const Color.fromARGB(255, 255, 229, 222), const Color.fromARGB(255, 254, 255, 212)],
      // June
      [const Color.fromARGB(255, 224, 248, 197), const Color.fromARGB(255, 206, 247, 247)],
      // July
      [const Color.fromARGB(255, 219, 231, 236), const Color.fromARGB(255, 178, 178, 179)],
      // August
      [const Color.fromARGB(255, 243, 236, 255), const Color.fromARGB(255, 234, 222, 255)],
      // September
      [const Color.fromARGB(255, 234, 253, 255), const Color.fromARGB(255, 197, 252, 209)],
      // October
      [const Color.fromARGB(255, 245, 212, 212), const Color.fromARGB(255, 244, 203, 248)],
      // November
      [const Color.fromARGB(255, 236, 224, 255), const Color.fromARGB(255, 200, 243, 196)],
      // December
      [const Color.fromARGB(255, 216, 240, 252), const Color.fromARGB(255, 199, 217, 224)],
    ];
  }

  @override
  void initState() {
    super.initState();
    fetchHolidays();
  }

  Future<void> fetchHolidays() async {
    try {
      final _client = HolidayEventApi('UMTx00APtcdG0DQAkySTXrjOv3Lc0U79');
      final eventsResponse = await _client.getEvents();

      if (eventsResponse.events.isEmpty) {
        print('No events found.');
        return;
      }
      final events = await _client.getEvents();
      final List<EventSummary> upcomingEvents = events.events;
      final List<Map<String, dynamic>> mappedEvents = [];

      for (final event in upcomingEvents) {
        final eventInfo = await _client.getEventInfo(id: event.id);
        final List<Occurrence>? occurrences = eventInfo.event.occurrences;
        if (occurrences != null && occurrences.isNotEmpty) {
          for (final occurrence in occurrences) {
            mappedEvents.add({
              'date': occurrence,
              'tasks': [
                {'name': event.name, 'description': event.name}
              ]
            });
          }
        }
      }
      setState(() {
        taskData = mappedEvents;
      });
    } catch (e) {
      print('Error fetching holidays: $e');
    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      taskData = taskData
          .where((task) => task['date'].year == selectedDay.year && task['date'].month == selectedDay.month && task['date'].day == selectedDay.day)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: getMonthlyGradients()[_monthIndex],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _focusedDay = DateTime.utc(_focusedDay.year, _focusedDay.month - 1, 1);
                            if (_monthIndex == 0) {
                              _monthIndex = 11;
                            } else {
                              _monthIndex--;
                            }
                          },
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      '${DateFormat.yMMMM().format(_focusedDay)}', // Display current month and year
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _focusedDay = DateTime.utc(_focusedDay.year, _focusedDay.month + 1, 1);
                            if (_monthIndex == 11) {
                              _monthIndex = 0;
                            } else {
                              _monthIndex++;
                            }
                          },
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Add space for the header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TableCalendar(
                    firstDay: DateTime.utc(_focusedDay.year, _focusedDay.month, 1),
                    lastDay: DateTime.utc(_focusedDay.year, _focusedDay.month + 1, 0),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: _onDaySelected,
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    holidayPredicate: (day) {
                      return day.weekday >= 6;
                    },
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false, // Hide the format button
                    ),
                    headerVisible: false, // Hide the default header
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              height: 250,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: taskData.length,
                      itemBuilder: (context, index) {
                        return _buildTaskItem(
                          context,
                          date: taskData[index]['date'],
                          tasks: taskData[index]['tasks'],
                          colorIndex: index % 11,
                          onTap: () {
                            // Implement the onTap functionality here if needed
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }
}

Widget _buildTaskItem(BuildContext context,
    {required String date, List<Map<String, dynamic>>? tasks, required int colorIndex, required Function onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 45),
          Text(
            date,
            style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
        ],
      ),
      SizedBox(height: 8),
      if (tasks != null)
        Column(
          children: tasks.map(
            (task) {
              final String taskName = task['name'];
              final String taskDescription = task['description'];
              List<Color> colorsData = [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow,
                Colors.cyan,
                Colors.pink,
                Colors.purple,
                Colors.orange,
                Colors.brown,
                Colors.indigo,
                Colors.teal,
              ];
              return GestureDetector(
                onTap: () {
                  onTap(taskName, taskDescription);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: 307,
                    height: 91,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 307,
                            height: 91,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          child: Container(
                            decoration: BoxDecoration(
                              color: colorsData[colorIndex], //here
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(19),
                                bottomLeft: Radius.circular(19),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 40,
                          child: Text(
                            taskName,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Color.fromRGBO(65, 65, 65, 1),
                              fontFamily: 'Inter',
                              fontSize: 11,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      const SizedBox(height: 20),
    ],
  );
}

void _showTaskDetailsDialog(BuildContext context, String taskName, String description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$taskName'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}
