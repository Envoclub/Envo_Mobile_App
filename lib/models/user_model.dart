// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String email;
  String id;
  String organisation;
  String firstName;
  String lastName;
  UserModel({
    required this.email,
    required this.id,
    required this.organisation,
    required this.firstName,
    required this.lastName,
  });

  UserModel copyWith({
    String? email,
    String? id,
    String? organisation,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      email: email ?? this.email,
      id: id ?? this.id,
      organisation: organisation ?? this.organisation,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
      'organisation': organisation,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      id: map['id'].toString(),
      organisation: map['organisation']??"" as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, id: $id, organisation: $organisation, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.id == id &&
      other.organisation == organisation &&
      other.firstName == firstName &&
      other.lastName == lastName;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      id.hashCode ^
      organisation.hashCode ^
      firstName.hashCode ^
      lastName.hashCode;
  }
}

  