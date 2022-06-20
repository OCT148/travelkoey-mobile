// @dart=2.9

class Users {
  int id;
  String name;
  String email;
  String password;
  String token;

  Users({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: int.parse(json['id']),
        name: json['name'],
        email: json['email'],
        password: json['password'],
    );
  }
}