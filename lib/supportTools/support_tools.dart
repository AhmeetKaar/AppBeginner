import 'package:flutter/material.dart';

class AllAppBar {
  static AppBar allAppBar = AppBar(
        title: Text(
          'Followers Information',
          style: AllAppBar.appBarStyle,
        ),
        backgroundColor: Colors.orange,
      );

  static TextStyle appBarStyle = const TextStyle(
    letterSpacing: 2,
    color: Color.fromARGB(201, 255, 255, 255),
    fontSize: 30,
    fontStyle: FontStyle.italic
  );
}

