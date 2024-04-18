import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigator.dart';

class NotificationPageOnWidget extends StatefulWidget {
  @override
  _NotificationPageOnWidgetState createState() => _NotificationPageOnWidgetState();
}

class _NotificationPageOnWidgetState extends State<NotificationPageOnWidget> {
  int _currentIndex = 4;
  bool _themeIndex = false;
  final ValueNotifier<bool> switchNotifier1 = ValueNotifier<bool>(true);
  final ValueNotifier<bool> switchNotifier2 = ValueNotifier<bool>(true);
  final ValueNotifier<bool> switchNotifier3 = ValueNotifier<bool>(true);

  List<List<Color>> getGradients() {
    return [
      [const Color.fromARGB(255, 199, 244, 252), const Color.fromARGB(255, 213, 253, 212)],
      [Color.fromARGB(255, 105, 101, 153), Color.fromARGB(255, 107, 107, 107)],
    ];
  }

  void _toggleTheme() {
    setState(() {
      _themeIndex = !_themeIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: getGradients()[_themeIndex ? 1 : 0],
          ),
        ),
        child: Stack(
          children: [
            _buildNotificationContent(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget _buildNotificationContent() {
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
                    blurRadius: 2, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: const Text(
                'Notifications',
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Adjust padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                  children: [
                    _buildNotiItem(title: 'Turn on notification', valueNotifier: switchNotifier1),
                    Visibility(
                      visible: !_themeIndex,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          _buildCustomLine(thickness: 1),
                          SizedBox(height: 10),
                          _buildSelectItem(title: 'Activity notification', valueNotifier: switchNotifier2),
                          SizedBox(height: 10),
                          _buildSelectItem(title: 'Mute', valueNotifier: switchNotifier3),
                        ],
                      ),
                    ),
                    SizedBox(height: 10), // Reduce height
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomLine({double thickness = 1, Color color = const Color.fromARGB(255, 196, 196, 196)}) {
    return SizedBox(
      width: 275, // Set width to zero
      child: Center(
        child: Container(
          height: thickness,
          color: color,
        ),
      ),
    );
  }

  Widget _buildNotiItem({required String title, required ValueNotifier<bool> valueNotifier}) {
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
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: valueNotifier,
              builder: (context, value, child) {
                return CupertinoSwitch(
                  value: value,
                  onChanged: (newValue) {
                    valueNotifier.value = newValue;
                    _toggleTheme(); // Toggle theme when switch changes
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectItem({required String title, required ValueNotifier<bool> valueNotifier}) {
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
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: valueNotifier,
              builder: (context, value, child) {
                return CupertinoSwitch(
                  value: value,
                  onChanged: (newValue) {
                    valueNotifier.value = newValue;
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
