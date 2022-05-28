import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  static Future<User> getUser(int id) async {
    var url = Uri.https('reqres.in', '/api/users/$id');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      var userData = (result as Map<String, dynamic>)['data'];
      return User.fromJson(userData);
    } else {
      throw Exception('Gagal mendapatkan data user');
    }
  }
}
