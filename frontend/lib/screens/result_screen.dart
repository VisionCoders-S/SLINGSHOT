import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rankedCareers;
  final Map<String, int> categoryScores;

  const ResultScreen({
    super.key,
    required this.rankedCareers,
    required this.categoryScores,
  });

  @override
  Widget build(BuildContext context) {
    final topCareer = rankedCareers.first;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Your Career Match"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Top Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "🎯 Top Recommendation",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      topCareer["name"],
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "${topCareer["percentage"].toStringAsFixed(1)}% Compatibility",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    LinearProgressIndicator(
                      value: topCareer["percentage"] / 100,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top Matches",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              ...rankedCareers.take(3).map(
                (career) => ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(career["name"]),
                  trailing: Text(
                    "${career["percentage"].toStringAsFixed(1)}%",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Retake Assessment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}