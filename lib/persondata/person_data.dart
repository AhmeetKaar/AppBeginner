import 'package:beginnerapp/supportTools/support_tools.dart';
import 'package:flutter/material.dart';
import 'package:beginnerapp/main.dart';

class DataPerson extends StatefulWidget {
  const DataPerson({super.key});
  @override
  State<DataPerson> createState() => _DataPersonState();
}

class _DataPersonState extends State<DataPerson> {
  final dataService = MyHomePageState().myListFollow;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar.allAppBar,
      body: ListView.builder(
              itemCount: dataService.length,
              itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(
                      dataService[index]['url'] as String,
                    ),
                  );
              },
            ),      
    );
  }
}
