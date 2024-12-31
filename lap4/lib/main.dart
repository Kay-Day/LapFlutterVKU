import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(Magic8BallApp());

class Magic8BallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Magic8BallScreen(),
    );
  }
}

class Magic8BallScreen extends StatefulWidget {
  @override
  _Magic8BallScreenState createState() => _Magic8BallScreenState();
}

class _Magic8BallScreenState extends State<Magic8BallScreen> {
  final List<String> answers = [
    'Yes',
    'No',
    'Ask again later',
    'Definitely',
    'I don\'t think so',
    'Absolutely',
    'Maybe',
    'Not sure',
  ];

  String currentAnswer = 'Tap the ball to ask!';

  void changeAnswer() {
    setState(() {
      currentAnswer = answers[Random().nextInt(answers.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic 8 Ball'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: changeAnswer,
              child: Image.asset('assets/images/balll.jpeg', height: 200),
            ),
            SizedBox(height: 20),
            Text(
              currentAnswer,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
