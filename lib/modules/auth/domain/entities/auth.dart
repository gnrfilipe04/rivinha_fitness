import 'package:rivinha_fitness/modules/core/vos/email.dart';
import 'package:rivinha_fitness/modules/core/vos/text.dart';

class Auth {
  Email _email;
  Text _password;

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Text get password => _password;
  void setPassword(String? value) => _password = Text(value ?? '');

  Auth({
    required String email,
    required String password,
  })  : _email = Email(email),
        _password = Text(password);
}
