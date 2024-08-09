import 'dart:convert';
import 'package:beginnerapp/supportTools/support_tools.dart';
import 'package:beginnerapp/persondata/person_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// GitHubService class'ını oluşturulım
// Service class'ları direk domain modellerini dönsün
// Localization
// Custom Widter'ları daha güzelleştirebilrsin 
// DI araştırılacak

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
  State<MyHomePage> createState() => MyHomePageState();
}

class AService {
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
      throw Exception("ERROR: Return => ${res.statusCode}.");
    }
  }
}

class MyHomePageState extends State<MyHomePage> {
  final url = Uri.parse("https://api.github.com/users/AhmeetKaar/followers");

  var isLoading = false;
  var errorMessage = "";
  late List<dynamic> myListFollow;

  final AService aService = AService();

  @override
  void initState() {
    super.initState();
    aService.apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar.allAppBar,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: myListFollow.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const DataPerson()));
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(
                      myListFollow[index]['login'],
                    ),
                    trailing: Image.network(
                      myListFollow[index]['avatar_url'],
                      fit: BoxFit.cover,
                      height: 60.0,
                      width: 60.0,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
