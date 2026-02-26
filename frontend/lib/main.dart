import 'package:flutter/material.dart';

void main() {
  runApp(const PathForgeApp());
}

class PathForgeApp extends StatelessWidget {
  const PathForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PathForge AI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PathForge AI'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Career Intelligence System",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Hackathon Prototype v1.0",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}