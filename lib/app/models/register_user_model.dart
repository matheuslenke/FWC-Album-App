// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterUserModel(
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  );

  RegisterUserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterUserModel(
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
      map['password_confirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserModel.fromJson(String source) =>
      RegisterUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterUserModel(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(covariant RegisterUserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode;
  }
}
