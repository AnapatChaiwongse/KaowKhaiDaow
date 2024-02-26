import 'package:flutter/material.dart';
import 'navigator.dart';

class ThemeCustomizationPage extends StatelessWidget {
  int _currentIndex = 4;

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
            colors: [Color.fromARGB(255, 213, 192, 230)!, Color.fromRGBO(209, 255, 252, 1)!],
          ),
        ),
        child: Stack(
          children: [
            _buildThemeCustomizationContent(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget _buildThemeCustomizationContent() {
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
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(215, 232, 248, 100),
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
                'Theme Customization',
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
                    _buildCustomizationItem(title: 'Theme Color'),
                    SizedBox(height: 20),
                    _buildCustomizationItem(title: 'Font'),
                    SizedBox(height: 20),
                    _buildCustomizationItem(title: 'Font Size'),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildApplyResetButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomizationItem({required String title}) {
    return Container(
      width: 250,
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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

  Widget _buildApplyResetButtons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(title: 'Reset', color: Color.fromRGBO(250, 158, 158, 1)),
          SizedBox(width: 20),
          _buildButton(title: 'Apply', color: Color.fromRGBO(146, 200, 120, 1)),
        ],
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
}
