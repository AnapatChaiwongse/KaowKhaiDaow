import 'package:flutter/material.dart';
import 'notificationSettingPage.dart';
import 'themeSettingPage.dart';
import 'backupandrestoreSettingPage.dart';
import 'syncingpreferenceSettingPage.dart';
import 'languageSettingPage.dart';
import 'dateandtimeSettingPage.dart';
import 'navigator.dart';

class SettingPage extends StatelessWidget {
  int _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18, // Adjust the size as needed
          ),
        ),
        titleSpacing: -10,
        leading: SizedBox.shrink(),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 212, 238, 207),
                Color.fromARGB(255, 207, 227, 245),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            _buildSettingItem(
              title: 'Theme Customization',
              color: Color.fromRGBO(236, 229, 251, 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemeCustomizationPage()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildSettingItem(
              title: 'Notifications',
              color: Color.fromRGBO(214, 231, 247, 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPageOnWidget()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildSettingItem(
              title: 'Language',
              color: Color.fromRGBO(214, 247, 221, 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => languagePage()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildSettingItem(
              title: 'Date and Time formats',
              color: Color.fromRGBO(255, 251, 219, 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dateandtimePage()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildSettingItem(
              title: 'Syncing Preferences',
              color: Color.fromRGBO(255, 234, 218, 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => syncingpreferencePage()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildSettingItem(
              title: 'Backup And Restore',
              color: Color.fromRGBO(255, 204, 204, 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => backupandrestorePage()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget _buildSettingItem({required String title, required Color color, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Container(
          width: double.infinity,
          height: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color.withOpacity(0.8), // Adjust opacity as needed
                color.withOpacity(0.9), // Adjust opacity as needed
              ],
            ),
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
