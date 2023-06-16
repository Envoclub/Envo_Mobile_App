// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String email;

  String phone_number;
  String username;
  String bio;
  String photoUrl;
  UserModel({
    required this.email,
    required this.phone_number,
    required this.username,
    required this.bio,
    required this.photoUrl,
  });

  UserModel copyWith({
    String? email,
    String? phone_number,
    String? username,
    String? bio,
    String? photoUrl,
  }) {
    return UserModel(
      email: email ?? this.email,
      phone_number: phone_number ?? this.phone_number,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone_number': phone_number,
      'username': username,
      'bio': bio,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      phone_number: map['phone_number'] as String,
      username: map['username'] as String,
      bio: map['bio'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, phone_number: $phone_number, username: $username, bio: $bio, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.phone_number == phone_number &&
        other.username == username &&
        other.bio == bio &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        phone_number.hashCode ^
        username.hashCode ^
        bio.hashCode ^
        photoUrl.hashCode;
  }
}
