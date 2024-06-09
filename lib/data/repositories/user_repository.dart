import 'package:http/http.dart' as http;
import 'package:impactapp/data/models/user_model.dart';
import 'dart:convert';

class UserRepository {
  final String baseUrl = 'https://reqres.in/api';

  Future<List<UserModel>> fetchUsers(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/users?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<UserModel> users = (data['data'] as List).map((userJson) => UserModel.fromJson(userJson)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserModel> fetchUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data['data']);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
