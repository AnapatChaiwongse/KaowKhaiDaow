import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'navigator.dart';

class MoodPage extends StatefulWidget {
  final int _currentIndex = 0;
  int _monthIndex = 0;

  MoodPage({Key? key}) : super(key: key);

  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: getMonthlyGradients()[widget._monthIndex],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          if (widget._monthIndex > 0) {
                            widget._monthIndex--;
                          }
                        });
                      },
                    ),
                    Text(
                      "Daily Mood, ${months[widget._monthIndex]}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        setState(() {
                          if (widget._monthIndex < months.length - 1) {
                            widget._monthIndex++;
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                weekTable(weekday: 1, onPressed: () => _showChoice(context)),
                weekTable(weekday: 2, onPressed: () => _showChoice(context)),
                weekTable(weekday: 3, onPressed: () => _showChoice(context)),
                weekTable(weekday: 4, onPressed: () => _showChoice(context)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: widget._currentIndex,
      ),
    );
  }

  void _showChoice(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24), // Adjust the padding as needed
          child: SizedBox(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Choice(),
              ],
            ),
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}

class weekTable extends StatelessWidget {
  final int weekday;
  final VoidCallback onPressed;

  weekTable({required this.weekday, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Week $weekday",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(72, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(72, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(72, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(72, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(72, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(72, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(72, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Select your mood"),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image(
              image: AssetImage('assets/images/emoji/01.jpg'),
              width: 90,
              height: 90,
            ),
            Image(
              image: AssetImage('assets/images/emoji/02.jpg'),
              width: 90,
              height: 90,
            ),
            Image(
              image: AssetImage('assets/images/emoji/03.jpg'),
              width: 90,
              height: 90,
            ),
            Image(
              image: AssetImage('assets/images/emoji/04.jpg'),
              width: 90,
              height: 90,
            ),
          ],
        ),
      ],
    );
  }
}
