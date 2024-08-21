import 'package:flutter/material.dart';

class AllAppBar extends AppBar {
  AllAppBar({super.key})
      : super(
            title: const Text(
              'Github Data',
              style: TextStyle(
                  letterSpacing: 2,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 30,
                  ),
            ),
            backgroundColor: Colors.blueAccent);
}
