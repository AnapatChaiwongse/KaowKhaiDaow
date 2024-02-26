import 'package:flutter/material.dart';
import 'navigator.dart';

class syncingpreferencePage extends StatelessWidget {
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
            colors: [Color.fromARGB(255, 239, 255, 181)!, Color.fromARGB(255, 213, 250, 255)!],
          ),
        ),
        child: Stack(
          children: [
            _buildSyncingContent(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget _buildSyncingContent() {
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
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 223, 223, 1),
                borderRadius: BorderRadius.circular(30), // Rounded border
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 2, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: Text(
                'Syncing Preferences',
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
                borderRadius: BorderRadius.circular(20), // Rounded border
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                  children: [
                    SizedBox(height: 20),
                    _buildSyncingItem(title: "Sign In"),
                    SizedBox(height: 15),
                    _buildSyncingItem(title: "Create Account"),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSyncingItem({required String title}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Container(
          width: 250,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(224, 240, 255, 1),
            borderRadius: BorderRadius.circular(30), // Rounded border
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2), // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 3, // Blur radius
                offset: Offset(0, 3), // Offset
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
