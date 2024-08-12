import 'package:beginnerapp/supportTools/support_tools.dart';
import 'package:flutter/material.dart';
import 'package:beginnerapp/page/second_page.dart';
import 'package:beginnerapp/service/api_service.dart';
import 'package:beginnerapp/model/followers_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final dataService = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: FutureBuilder<List<FollowersModel>?>(
        future: dataService.apiCall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final List<FollowersModel>? followers = snapshot.data;
            return ListView.builder(
              itemCount: followers?.length ?? 0,
              itemBuilder: (context, index) {
                final follower = followers![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DataPerson(login: follower.login ?? ''),
                    ));
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(follower.login ?? 'No login'),
                    trailing: Image.network(
                      follower.avatarUrl ?? '',
                      fit: BoxFit.cover,
                      height: 60.0,
                      width: 60.0,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
