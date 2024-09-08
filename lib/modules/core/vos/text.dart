import 'package:rivinha_fitness/modules/core/vos/value_object.dart';

class Text implements ValueObject {
  final String _value;

  Text(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @override
  String toString() => _value;
}
