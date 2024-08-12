import 'package:beginnerapp/page/first_page.dart';
import 'package:beginnerapp/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'API'),
    );
  }
}
