import 'dart:convert';

import 'package:beginnerapp/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService{

  final String url = "https://reqres.in/api/users?page=2";

  Future<UsersModel?> fetchUsers() async{

    var res = await http.get(Uri.parse(url));
    if(res.statusCode == 200)
    {
      var jsonBody = UsersModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    }
    else
    {
      print("ERROR: Return => ${res.statusCode}.");
    }
    return null;
    
  }
}
