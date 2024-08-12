// second_page.dart
import 'package:flutter/material.dart';
import 'package:beginnerapp/service/api_service.dart'; 
import 'package:beginnerapp/model/user_model.dart';

class DataPerson extends StatelessWidget {
  final String login;

  const DataPerson({super.key, required this.login});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(login)),
      body: FutureBuilder<UserModel>(
        future: ApiService().apiInfortmation(login),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                if (user.avatarUrl != null)
                  Image.network(
                    user.avatarUrl!,
                    fit: BoxFit.cover,
                    height: 400.0,
                    width: 400.0,
                  ),
                ListTile(title: Text('Name: ${user.name ?? 'N/A'}')),
                ListTile(title: Text('Location: ${user.location ?? 'N/A'}')),
                ListTile(title: Text('Blog: ${user.blog ?? 'N/A'}')),
                ListTile(title: Text('Bio: ${user.blog ?? "No bio available"}')),
                ListTile(title: Text('Public Repos: ${user.publicRepos ?? 0}')),
                ListTile(title: Text('Followers: ${user.followers ?? 0}')),
                ListTile(title: Text('Following: ${user.following ?? 0}')),
              ],
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
