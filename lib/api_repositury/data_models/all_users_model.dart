import 'dart:convert';

List<AllUsersModel> allUsersModelFromJson(String str) => List<AllUsersModel>.from(json.decode(str).map((x) => AllUsersModel.fromJson(x)));

class AllUsersModel {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? type;

  AllUsersModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.type,
  });

  factory AllUsersModel.fromJson(Map<String, dynamic> json) => AllUsersModel(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    type: json["type"],
  );
}
