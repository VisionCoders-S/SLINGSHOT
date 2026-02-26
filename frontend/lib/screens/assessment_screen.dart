import 'package:flutter/material.dart';
import '../utils/dummy_questions.dart';
import '../utils/career_data.dart';
import 'result_screen.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  int currentQuestionIndex = 0;
  int selectedValue = 3;

  Map<String, int> categoryScores = {};
  bool isCompleted = false; // 🔥 prevents double submission

  void nextQuestion() {
    if (isCompleted) return; // stop if already finished

    final currentQuestion = dummyQuestions[currentQuestionIndex];

    // Store score only once
    categoryScores.update(
      currentQuestion.category,
      (value) => value + selectedValue,
      ifAbsent: () => selectedValue,
    );

    if (currentQuestionIndex < dummyQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedValue = 3;
      });
    } else {
      setState(() {
        isCompleted = true;
      });
      showResults();
    }
  }

void showResults() {
  String bestCareer = "";
  int bestScore = 0;

  for (var career in careers) {
    int total = 0;

    career.weightProfile.forEach((category, weight) {
      int userScore = categoryScores[category] ?? 0;
      total += userScore * weight;
    });

    if (total > bestScore) {
      bestScore = total;
      bestCareer = career.name;
    }
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ResultScreen(
        careerName: bestCareer,
        score: bestScore,
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final question = dummyQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Assessment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1} of ${dummyQuestions.length}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              question.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Slider(
              value: selectedValue.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              label: selectedValue.toString(),
              onChanged: isCompleted
                  ? null
                  : (value) {
                      setState(() {
                        selectedValue = value.toInt();
                      });
                    },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isCompleted ? null : nextQuestion,
              child: Text(
                currentQuestionIndex == dummyQuestions.length - 1
                    ? "Finish"
                    : "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}