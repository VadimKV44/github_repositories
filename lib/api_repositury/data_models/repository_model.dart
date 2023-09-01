import 'dart:convert';

List<RepositoryModel> repositoryModelFromJson(String str) => List<RepositoryModel>.from(json.decode(str).map((x) => RepositoryModel.fromJson(x)));

class RepositoryModel {
  int? id;
  String? name;
  bool? private;
  Owner? owner;
  String? description;
  bool? fork;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? pushedAt;
  String? visibility;
  int? forks;
  int? watchers;
  String? defaultBranch;
  String? language;
  String? message;
  String? error;

  RepositoryModel({
    this.id,
    this.name,
    this.private,
    this.owner,
    this.description,
    this.fork,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.visibility,
    this.forks,
    this.watchers,
    this.defaultBranch,
    this.language,
    this.message,
    this.error,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) => RepositoryModel(
        id: json["id"],
        name: json["name"],
        private: json["private"],
        owner: Owner.fromJson(json["owner"]),
        description: json["description"],
        fork: json["fork"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pushedAt: DateTime.parse(json["pushed_at"]),
        visibility: json["visibility"],
        forks: json["forks"],
        watchers: json["watchers"],
        defaultBranch: json["default_branch"],
        language: json["language"],
        message: json["message"],
      );
}

class Owner {
  String? login;
  String? avatarUrl;
  String? type;

  Owner({
    this.login,
    this.avatarUrl,
    this.type,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        type: json["type"],
      );
}
