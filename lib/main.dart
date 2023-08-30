import 'package:flutter/material.dart';
import 'package:github_repositories/screens/search_repository_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchRepositoryScreen(),
    );
  }
}