import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class UserModel {
  final String? id;
  final String? email;
  final String? name;
  final String? photoURL;
  final int? role;
  final String? metadata;

  UserModel(
      {required this.id,
      this.email,
      this.name,
      this.photoURL,
      this.role,
      this.metadata});

  static Map<String, dynamic> userToJson(UserModel data) => {
        "id": data.id,
        "name": data.name,
        "email": data.email,
        "metadata": data.metadata,
        "photoURL": data.photoURL,
        "role": data.role,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        email: map['email'],
        name: map['name'],
        photoURL: map['photoURL'],
        role: map['role'],
        metadata: map['metadata']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "metadata": metadata,
        "photoURL": photoURL,
        "role": role,
      };

  String toJson() => jsonEncode(toMap());
}
