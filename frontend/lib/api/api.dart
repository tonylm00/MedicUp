import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../model_object/farmaco.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  UserProvider() {
    this.fetchTasks();
  }

  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }

  void registerUser(User user) async {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/apis/user/?format=json'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(user));
    log(response.toString());

    if (response.statusCode == 201) {
      user.email = json.decode(response.body)['email'];
      _users.add(user);
      notifyListeners();
    }
  }

  void deleteUser(User user) async {
    final response = await http
        .delete(Uri.parse('http://10.0.2.2:8000/apis/user/${user.email}/'));
    if (response.statusCode == 204) {
      _users.remove(user);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/apis/user/?format=json'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;

      _users = data.map((json) => User.fromJson(json)).toList();
      notifyListeners();
    }
  }
}

//INFORMAZIONI SU UN FARMACO
class FarmacoProvider with ChangeNotifier {
  FarmacoProvider() {
    this.fetchTasks();
  }

  List<Farmaco> _farmaco = [];

  List<Farmaco> get farmaco {
    return [..._farmaco];
  }

  void showFarmaco(Farmaco farmaco) async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/apis/farmaco/${farmaco.id}/'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _farmaco = data.map((json) => Farmaco.fromJson(json)).toList();
      notifyListeners();
    }
  }

  fetchTasks() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/apis/farmaco/?format=json/'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _farmaco = data.map((json) => Farmaco.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
