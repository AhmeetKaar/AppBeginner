import 'package:beginnerapp/customWidget/support_tools.dart';
import 'package:flutter/material.dart';
import 'package:beginnerapp/screen/user_data_screen.dart';
import 'package:beginnerapp/model/followers_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.followersData,});
  final String title;
  final List<FollowersModel>? followersData;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<FollowersModel>? followersData = widget.followersData;
    return Scaffold(
      appBar: AllAppBar(),
      body: followersData == null || followersData.isEmpty
          ? const Center(child: Text('Error: failed to load data.'))
          : ListView.builder(
              itemCount: followersData.length,
              itemBuilder: (context, index) {
                final follower = followersData[index];
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
            ),
    );
  }
}
