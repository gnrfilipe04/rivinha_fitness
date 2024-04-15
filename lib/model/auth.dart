import 'package:rivinha_fitness/vos/email.dart';
import 'package:rivinha_fitness/vos/text.dart';

class AuthModel {
  Email _email;
  Text _password;

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Text get password => _password;
  void setPassword(String? value) => _password = Text(value ?? '');

  factory AuthModel.empty() {
    return AuthModel(email: '', password: '');
  }

  AuthModel({
    required String email,
    required String password,
  })  : _email = Email(email),
        _password = Text(password);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email.toString(),
      'password': password.toString(),
    };
  }
}
