import 'dart:convert';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class UserModel {
  final String id = uuid.v4();
  final String name;
  final String? photoURL;
  final String? role;

  UserModel({id, required this.name, this.photoURL, this.role});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        name: map['name'],
        photoURL: map['photoURL'],
        role: map['role']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() =>
      {"id": id, "name": name, "photoURL": photoURL, "role": role};

  String toJson() => jsonEncode(toMap());
}
