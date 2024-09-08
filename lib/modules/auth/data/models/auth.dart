import 'package:rivinha_fitness/modules/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  AuthModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );

  factory AuthModel.empty() {
    return AuthModel(email: '', password: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email.toString(),
      'password': password.toString(),
    };
  }
}
