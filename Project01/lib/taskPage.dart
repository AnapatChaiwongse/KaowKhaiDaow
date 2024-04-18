import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'navigator.dart';

class TaskPage extends StatelessWidget {
  final int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18, // Adjust the size as needed
          ),
        ),
        titleSpacing: -10,
        leading: SizedBox.shrink(),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromARGB(255, 212, 238, 207), Color.fromARGB(255, 207, 227, 245)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Tasks").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: snapshot.data!.docs.map((doc) {
                      return _buildTaskItem(
                        date: doc['date'],
                        tasks: doc['name'],
                        desc: doc['description'],
                        colorIndex: doc['color'] % 11,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            _buildAddNewTask(),
            const SizedBox(height: 40)
          ],
        ),
      ),
      bottomNavigationBar: NavigationWidget(
        currentIndex: _currentIndex,
      ),
    );
  }
}

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

class _buildTaskItem extends StatelessWidget {
  final String date;
  final String tasks;
  final String desc;
  final int colorIndex;

  const _buildTaskItem({
    Key? key,
    required this.date,
    required this.tasks,
    required this.desc,
    required this.colorIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 45),
            Text(
              date,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
          ],
        ),
        SizedBox(height: 8),
        if (tasks != null)
          GestureDetector(
            onTap: () {
              _showTaskDetailsDialog(context, tasks, desc);
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
                          color: colorIndex < colorsData.length
                              ? colorsData[colorIndex]
                              : Colors.grey, // Use a default color if colorIndex is out of bounds
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
                        tasks,
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
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _showTaskDetailsDialog(BuildContext context, String tasks, String desc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tasks),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(desc),
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
}

Widget _buildAddNewTask() {
  return Container(
    width: 307,
    height: 91,
    decoration: BoxDecoration(
      color: Color.fromRGBO(246, 246, 246, 1),
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
    child: const Stack(
      children: <Widget>[
        Positioned(
          top: 40,
          left: 0,
          width: 307,
          child: Text(
            'Add new task',
            textAlign: TextAlign.center,
            style: TextStyle(
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
  );
}
