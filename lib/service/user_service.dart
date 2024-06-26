// services/user_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';


class UserService {
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
