import 'package:flutter/material.dart';

class AllAppBar extends AppBar{
  AllAppBar({super.key}):super(
    title: const Text('Followers Information',
    style: TextStyle(letterSpacing: 2, color: Color.fromARGB(201, 255, 255, 255),
    fontSize: 30,
    fontStyle: FontStyle.italic),
    ),
    backgroundColor: Colors.orange,
  );
}


