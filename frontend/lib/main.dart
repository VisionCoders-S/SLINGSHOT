import 'package:flutter/material.dart';
import 'screens/assessment_screen.dart';

void main() {
  runApp(const PathForgeApp());
}

class PathForgeApp extends StatelessWidget {
  const PathForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AssessmentScreen(),
    );
  }
}