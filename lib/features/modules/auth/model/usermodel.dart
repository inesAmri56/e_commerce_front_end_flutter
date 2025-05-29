class UserModel {
  String? refreshToken;
  int? id;
  String? username;
  String? email;
  List<String>? roles;
  String? accessToken;
  String? tokenType;

  UserModel({
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.roles,
    this.accessToken,
    this.tokenType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      refreshToken: json['refreshToken'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refreshToken': refreshToken,
      'id': id,
      'username': username,
      'email': email,
      'roles': roles,
      'accessToken': accessToken,
      'tokenType': tokenType,
    };
  }
}
