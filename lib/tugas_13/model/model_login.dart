// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelLogin {
  int? id;
  String email;
  String username;
  String password;

  ModelLogin({
    this.id,
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  factory ModelLogin.fromMap(Map<String, dynamic> map) {
    return ModelLogin(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelLogin.fromJson(String source) =>
      ModelLogin.fromMap(json.decode(source) as Map<String, dynamic>);
}
