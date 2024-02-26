import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigator.dart';

class dateandtimePage extends StatelessWidget {
  int _currentIndex = 4;
  final ValueNotifier<bool> switchNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 255, 254, 175)!, Color.fromRGBO(209, 255, 252, 1)!],
          ),
        ),
        child: Stack(
          children: [
            _buildDateContent(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget _buildDateContent() {
    return Positioned(
      top: 62,
      left: 0,
      right: 0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 255, 172, 1),
                borderRadius: BorderRadius.circular(30), // Rounded border
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: Text(
                'Date and Time Formats',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16), // Add left and right padding
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _buildSelectItem(title: 'Set Automatically'),
                    SizedBox(height: 10),
                    _buildDateItem(title: 'Time Zone'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateItem({required String title}) {
    return Container(
      width: 240,
      height: 20,
      child: Text(
        title,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildButton({required String title, required Color color}) {
    return Container(
      width: 96,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        color: color,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 16,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectItem({required String title}) {
    return Container(
      width: 278,
      height: 51,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: switchNotifier,
              builder: (context, value, child) {
                return CupertinoSwitch(
                  value: value,
                  onChanged: (newValue) {
                    switchNotifier.value = newValue;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
