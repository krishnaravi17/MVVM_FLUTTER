// viewmodels/user_viewmodel.dart


import 'package:flutter/material.dart';
import 'package:mvvm_flutter_demo/models/user_model.dart';
import 'package:mvvm_flutter_demo/service/user_service.dart';

class UserViewModel extends ChangeNotifier{
  final UserService _userService = UserService();
  List<User> users = [];

  Future<void> fetchUsers() async {
    try {
      users = await _userService.getUsers();
    } catch (e) {
      print('Error fetching users: $e');
    }
  }
}
