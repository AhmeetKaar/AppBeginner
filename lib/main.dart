import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // ali dayı
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List', // ali dayının evinin adı
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'To Do List',), // ali dayının cocugu myhomepage
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title,});

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Scaffold evin tasarımcısı 
      appBar: AppBar(  // ekranın yukarısında bulunan farklı tema 
        title: Text(widget.title),       // temanın ortasına yazdığım miras gelen title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('SAYAÇ:',),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          setState(() {
            _counter += 1;
          });
        },
        child: const Text('ADD'),
      ), // 
    );
  }
}

