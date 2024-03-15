import 'package:flutter/material.dart';
import 'package:flutter_university_project/src/start_page/start_page.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       home: StartPage(),
    );
  }
}








