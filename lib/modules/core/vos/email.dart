import 'package:rivinha_fitness/modules/core/vos/text.dart';

class Email extends Text {
  final String _value;

  Email(String value)
      : _value = value,
        super(value);

  @override
  String? validator() {
    String? isEmpty = super.validator();

    if (isEmpty != null) {
      return isEmpty;
    }

    if (!_value.contains('@')) {
      return 'E-mail inválido';
    }
    return null;
  }
}
