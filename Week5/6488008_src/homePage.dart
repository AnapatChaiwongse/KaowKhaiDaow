import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:application/calendarPage.dart';
import 'package:application/navigator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int _currentIndex = 2;

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
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20), // Add padding to the left and right
                  child: Text(
                    "Hello, Kaow",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), // Make the text bold
                  ),
                ),
                SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20), // Add padding to the left and right
                  child: Text(
                    "February, 2024",
                    style: TextStyle(fontWeight: FontWeight.bold), // Make the text bold
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5), // Add padding to the left and right
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      buildCellContainer(buildCalendarCell()),
                      buildCellContainer(buildCell('Mood')),
                      buildCellContainer(buildCell('Task')),
                      Container(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20), // Add padding to the left and right
                  child: Text(
                    "March, 2024",
                    style: TextStyle(fontWeight: FontWeight.bold), // Make the text bold
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5), // Add padding to the left and right
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      buildCellContainer(buildCalendarCell()),
                      buildCellContainer(buildCell('Mood')),
                      buildCellContainer(buildCell('Task')),
                      Container(),
                    ],
                  ),
                ),
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
      padding: EdgeInsets.all(8), // Add padding around the Material widget
      child: Material(
        elevation: 3, // Set the elevation to add drop shadow
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget buildCalendarCell() {
    return TableCalendar(
      firstDay: DateTime.utc(_focusedDay.year, _focusedDay.month, 1),
      lastDay: DateTime.utc(_focusedDay.year, _focusedDay.month + 1, 0),
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
        defaultTextStyle: TextStyle(fontSize: 10), // Adjust the font size of the days
        weekendTextStyle: TextStyle(fontSize: 10), // Adjust the font size of the weekends
        outsideTextStyle: TextStyle(fontSize: 10), // Adjust the font size of days outside the month
        outsideDaysVisible: false, // Hide days outside the current month
      ),
      headerStyle: const HeaderStyle(
        titleTextStyle: TextStyle(fontSize: 0), // Adjust the font size of the month text
        titleCentered: true, // Ensure the title is centered horizontally
        formatButtonVisible: false, // Hide the format button
      ),
      rowHeight: 20, // Adjust the row height as needed
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
}
