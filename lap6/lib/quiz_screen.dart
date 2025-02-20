import 'package:flutter/material.dart';
import 'quiz_data.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(int selectedIndex) {
    if (selectedIndex ==
        questionList[currentQuestionIndex].correctAnswerIndex) {
      score++;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ Chính xác!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Sai rồi!")),
      );
    }

    setState(() {
      if (currentQuestionIndex < questionList.length - 1) {
        currentQuestionIndex++;
      } else {
        // Kết thúc quiz
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Kết thúc!"),
            content: Text("Điểm của bạn: $score/${questionList.length}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentQuestionIndex = 0;
                    score = 0;
                  });
                },
                child: Text("Chơi lại"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questionList[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text("Quiz JLPT N3")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Câu ${currentQuestionIndex + 1}/${questionList.length}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              question.kanji,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              question.hiragana,
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ...List.generate(
              question.options.length,
              (index) => Column(
                children: [
                  ElevatedButton(
                    onPressed: () => checkAnswer(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(question.options[index]),
                  ),
                  SizedBox(height: 15), 
          ]),
            ),
          ],
        ),
      ),
    );
  }
}
