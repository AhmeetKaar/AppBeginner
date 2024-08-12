import 'package:beginnerapp/core/core.dart';
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
                ListTile(
                  title: Text(context.translate.name),
                  subtitle: Text(user.name ?? 'N/A'),
                ),
                ListTile(
                  title: Text(context.translate.country),
                  subtitle: Text(user.location ?? 'N/A'),
                ),
                ListTile(
                  title: Text(context.translate.blog),
                  subtitle: Text(user.blog ?? 'N/A'),
                ),
                ListTile(
                  title: Text(context.translate.bio),
                  subtitle: Text(user.blog ?? "No bio available"),
                ),
                ListTile(
                  title: Text(context.translate.public_repo),
                  subtitle: Text(('${user.publicRepos ?? 0}')),
                ),
                ListTile(
                  title: Text(context.translate.followers),
                  subtitle: Text(('${user.followers ?? 0}')),
                ),
                ListTile(
                  title: Text(context.translate.following),
                  subtitle: Text('${user.following ?? 0}'),
                ),
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
