import 'package:beginnerapp/server/user_server.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

bool isValidUserData(dynamic data) {
  if (data == null) {
    return false;
  }
  return data.login != null &&
      data.id != null &&
      data.nodeId != null &&
      data.avatarUrl != null &&
      data.gravatarId != null &&
      data.url != null &&
      data.htmlUrl != null &&
      data.followersUrl != null &&
      data.following != null &&
      data.gistsUrl != null &&
      data.starredUrl != null &&
      data.subscriptionsUrl != null &&
      data.organizationsUrl != null &&
      data.reposUrl != null &&
      data.eventsUrl != null &&
      data.receivedEventsUrl != null &&
      data.type != null &&
      data.siteAdmin != null &&
      data.name != null &&
      data.publicRepos != null &&
      data.publicGists != null &&
      data.followers != null &&
      data.following != null &&
      data.createdAt != null &&
      data.updatedAt != null;
}

Future<UserModel?> apiCall() async {
  var res =
      await http.get(Uri.parse("https://api.github.com/users/AhmeetKaar"));

  if (res.statusCode == 200) {
    var jsonBody = UserModel.fromJson(jsonDecode(res.body));
    return jsonBody;
  } else {
    throw Exception("ERROR: Return => ${res.statusCode}.");
  }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: apiCall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (isValidUserData(snapshot.data)) {
            return Center(
              child: Text(
                'User Name: ${snapshot.data?.login},\n '
                'ID Number: ${snapshot.data?.id},}\n'
                'Node Id: ${snapshot.data?.nodeId},\n '
                'Avatar URL: ${snapshot.data?.avatarUrl},\n '
                'Gravatar ID: ${snapshot.data?.gravatarId},\n '
                'URL: ${snapshot.data?.url}, \n'
                'HTML URL: ${snapshot.data?.htmlUrl},\n '
                'Followers URL: ${snapshot.data?.followersUrl},\n '
                'Following URL: ${snapshot.data?.followingUrl},\n '
                'Gists URL: ${snapshot.data?.gistsUrl}, \n'
                'Starred URL: ${snapshot.data?.starredUrl},\n '
                'Subscriptions URL: ${snapshot.data?.subscriptionsUrl},\n '
                'Organizations URL: ${snapshot.data?.organizationsUrl},\n '
                'Repos URL: ${snapshot.data?.reposUrl}, \n'
                'Events URL: ${snapshot.data?.eventsUrl}, \n'
                'Received Events URL: ${snapshot.data?.receivedEventsUrl}, \n'
                'Type: ${snapshot.data?.type},\n '
                'Site Admin: ${snapshot.data?.siteAdmin},\n '
                'Name: ${snapshot.data?.name}, \n'
                'Public Repos: ${snapshot.data?.publicRepos},\n '
                'Public Gists: ${snapshot.data?.publicGists}, \n'
                'Followers: ${snapshot.data?.followers},\n'
                'Following: ${snapshot.data?.following},\n'
                'Created At: ${snapshot.data?.createdAt}, \n'
                'Updated At: ${snapshot.data?.updatedAt}',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return const Center(
              child: Text("FAILED TO LOAD!"),
            );
          }
        },
      ),
    );
  }
}
