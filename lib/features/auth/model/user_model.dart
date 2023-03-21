import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String surname;
  String email;
  String pwd;
  String re_pwd;
  String? token;
  String? id;
  UserModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.pwd,
    required this.re_pwd,
    this.token,
    this.id,
  });
  
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'email': email,
      'pwd': pwd,
      're_pwd': re_pwd,
      'token': token,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      email: map['email'] ?? '',
      pwd: map['pwd'] ?? '',
      re_pwd: map['re_pwd'] ?? '',
      token: map['token'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
