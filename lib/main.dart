import 'dart:convert';
import 'package:beginnerapp/supportTools/support_tools.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = Uri.parse("https://api.github.com/users/AhmeetKaar/followers");
  var isLoading = false;
  late List<dynamic> myListFollow;

  Future<http.Response?> apiCall() async {
    setState(() {
      isLoading = true;
    });
    final res = await http.get(url);
    try {
      if (res.statusCode == 200) {
        myListFollow = jsonDecode(res.body) as List;
        setState(() {
          isLoading = false;
        });
        return res;
      } else {
        throw Exception("ERROR: Return => ${res.statusCode}.");
      }
    } catch (e) {
      throw("try catch hata dönüyor.");
    }
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar.allAppBar,
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),) :
        ListView.builder(itemCount: myListFollow.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            title: Text(myListFollow[index]['login'],),
            trailing: Image.network(myListFollow[index]['avatar_url'],
            fit: BoxFit.cover,
            height: 60.0,
            width: 60.0,
            ),
            onTap: () {
            },
            );
        },
        ),
    );
  }
}
