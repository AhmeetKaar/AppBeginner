import 'dart:convert';
import 'package:beginnerapp/model/followers_model.dart';
import 'package:beginnerapp/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String fixUrl = 'https://api.github.com';

  Future<UserModel> apiUser(String login) async {
    final res = await http.get(Uri.parse('$fixUrl/users/$login'));
    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception("ERROR: Return => ${res.statusCode}.");
    }
  }

  Future<List<FollowersModel>?> apiFollowing() async {
    final res = await http.get(Uri.parse('$fixUrl/users/AhmeetKaar/following'));
    try {
      if (res.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(res.body);
        final List<FollowersModel> followers = jsonData.map((data) {
          return FollowersModel.fromJson(data as Map<String, dynamic>);
        }).toList();
        return followers;
      } else {
        throw Exception("ERROR: Return => ${res.statusCode}.");
      }
    } catch (e) {
      throw Exception("ERROR: Return => ${res.statusCode}.");
    }
  }
}
