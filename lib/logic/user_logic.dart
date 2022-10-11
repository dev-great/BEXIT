import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UserLogic with ChangeNotifier {
  LocalStorage storage = LocalStorage('userCredentials');

  Future<bool> login(String email, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://api.allshoppf.com/api/v1/user/login-user"),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"email": email, "password": password}));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("token")) {
        storage.setItem("token", data['token']);
        storage.setItem("id", data['user']['id']);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://api.allshoppf.com/api/v1/user/create-user"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("token")) {
        storage.setItem("token", data['token']);
        storage.setItem("id", data['user']['id']);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
