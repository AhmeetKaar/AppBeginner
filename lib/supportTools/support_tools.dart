import 'package:flutter/material.dart';

class AllAppBar extends AppBar{
  AllAppBar({super.key}):super(
    title: const Text('Following Information',
    style: TextStyle(letterSpacing: 2, color: Color.fromARGB(255, 238, 233, 233),
    fontSize: 30,
    fontStyle: FontStyle.italic),
    ),
    backgroundColor: const Color.fromARGB(179, 6, 14, 239)
  );
}


