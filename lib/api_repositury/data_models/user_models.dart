import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  String? login;
  String? avatarUrl;
  String? type;
  int? publicRepos;
  int? followers;
  int? following;
  DateTime? createdAt;
  String? message;
  String? error;

  UserModel({
    this.login,
    this.avatarUrl,
    this.type,
    this.publicRepos,
    this.followers,
    this.following,
    this.createdAt,
    this.message,
    this.error,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        type: json["type"],
        publicRepos: json["public_repos"],
        followers: json["followers"],
        following: json["following"],
        createdAt: DateTime.parse(json["created_at"]),
        message: json["message"],
      );
}
