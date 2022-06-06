import 'dart:convert';

class Users {
  int? userId;
  String? name;
  String? email;
  String? password;
  String? token;

  Users({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.token
  });

  factory Users.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    return Users(
      userId: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      token: json['token']
    );
  }

  void printAttributes() {
    print("id: ${this.userId}\n");
    print("name: ${this.name}\n");
    print("email: ${this.email}\n");
    print("password: ${this.password}\n");
    print("token: ${this.token}\n");
  }
}