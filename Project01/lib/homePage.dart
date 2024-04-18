import 'package:application/authentication.dart';
import 'package:firebase_auth/firebase_Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:application/navigator.dart';

class HomePage extends StatefulWidget {
  final User? user = Authentication().currentUser;

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int _currentIndex = 2;

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<List<Color>> getGradients() {
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 212, 238, 207)!, Color.fromARGB(255, 207, 227, 245)],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: 50), // Add space at the top
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align the content to the left
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20), // Add padding to the left and right
                  child: Text(
                    "Hello, ${user?.email ?? "guest"} ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), // Make the text bold
                  ),
                ),
                _buildMonthBox(0),
                _buildMonthBox(1),
                _buildMonthBox(2),
                _buildMonthBox(3),
                const SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget buildCellContainer(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 3, // Set the elevation to add drop shadow
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 15, 4, 8), // Add padding between content and border
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget buildCalendarCellContainer(Widget child, int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 3, // Set the elevation to add drop shadow
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: getGradients()[index],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 15, 4, 8), // Add padding between content and border
            child: child,
          ),
        ),
      ),
    );
  }

  Widget buildCalendarCell(int month) {
    return TableCalendar(
      firstDay: DateTime.utc(_focusedDay.year, month, 1),
      lastDay: DateTime.utc(_focusedDay.year, month + 1, 0),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
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
        defaultTextStyle: TextStyle(fontSize: 10),
        weekendTextStyle: TextStyle(fontSize: 10),
        outsideTextStyle: TextStyle(fontSize: 10),
        outsideDaysVisible: false,
      ),
      headerVisible: false,
      rowHeight: 25,
    );
  }

  Widget buildCell(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildMonthBox(int month) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20), // Add padding to the left and right
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${months[month]}, 2024",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5), // Add padding to the left and right
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              buildCalendarCellContainer(buildCalendarCell(DateTime.now().month), month),
              moodTable(),
              taskTable(),
              Container(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget moodTable() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 55,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget taskTable() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 175,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 175,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 175,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
