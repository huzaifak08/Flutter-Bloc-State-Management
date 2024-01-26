import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int userId;
  final int id;
  final String name;
  final String email;
  final String body;
  const PostModel({
    required this.userId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  PostModel copyWith({
    int? userId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(userId: $userId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  List<Object> get props {
    return [
      userId,
      id,
      name,
      email,
      body,
    ];
  }
}
