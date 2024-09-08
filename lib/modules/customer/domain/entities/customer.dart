import 'package:rivinha_fitness/modules/core/vos/email.dart';
import 'package:rivinha_fitness/modules/core/vos/text.dart';
import 'package:rivinha_fitness/modules/workout/data/models/workout_model.dart';

class Customer {
  String id;
  Text _name;
  Email _email;
  Text? _phone;
  Text? _password;
  Text? _confirmPassword;
  Text? _photoUrl;
  List<WorkoutModel> _workouts;
  DateTime? createdAt;

  Text get name => _name;
  void setName(String? value) => _name = Text(value ?? '');

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Text? get phone => _phone;
  void setPhone(String? value) => _phone = Text(value ?? '');

  Text? get password => _password;
  void setPassword(String? value) => _password = Text(value ?? '');

  Text? get confirmPassword => _confirmPassword;
  void setConfirmPassword(String? value) => _confirmPassword = Text(value ?? '');

  Text? get photoUrl => _photoUrl;
  void setPhotoUrl(String? value) => _photoUrl = Text(value ?? '');

  List<WorkoutModel> get workouts => _workouts;
  void setWorkouts(List<WorkoutModel> value) => _workouts = value;

  Customer({
    required this.id,
    this.createdAt,
    required String name,
    required String email,
    required String? phone,
    String? password,
    String? confirmPassword,
    String? photoUrl,
    required List<WorkoutModel> workouts,
  })  : _name = Text(name),
        _email = Email(email),
        _phone = Text(phone ?? ''),
        _password = Text(password ?? ''),
        _confirmPassword = Text(confirmPassword ?? ''),
        _photoUrl = Text(photoUrl ?? ''),
        _workouts = workouts;
}
