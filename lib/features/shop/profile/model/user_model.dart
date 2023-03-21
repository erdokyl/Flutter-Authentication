import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeUserModel {
  String name;
  String surname;
  String email;
  String pwd;   
  String id;
  HomeUserModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.pwd,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'email': email,
      'pwd': pwd,
      'id': id,
    };
  }

  factory HomeUserModel.fromMap(Map<String, dynamic> map) {
    return HomeUserModel(
      name: map['name'] ?? '',
      surname: map['surname']?? '',
      email: map['email'] ?? '',
      pwd: map['pwd'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeUserModel.fromJson(String source) => HomeUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
