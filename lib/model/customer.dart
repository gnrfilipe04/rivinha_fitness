import 'package:rivinha_fitness/model/workout.dart';
import 'package:rivinha_fitness/vos/email.dart';
import 'package:rivinha_fitness/vos/text.dart';

class CustomerModel {
  int id;
  Text _name;
  Email _email;
  Text _phone;
  Text? _password;
  Text? _confirmPassword;
  Text? _photoUrl;
  List<Workout>? _workouts;
  DateTime? createdAt;

  Text get name => _name;
  void setName(String? value) => _name = Text(value ?? '');

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Text get phone => _phone;
  void setPhone(String? value) => _phone = Text(value ?? '');

  Text? get password => _password;
  void setPassword(String? value) => _password = Text(value ?? '');

  Text? get confirmPassword => _confirmPassword;
  void setConfirmPassword(String? value) =>
      _confirmPassword = Text(value ?? '');

  Text? get photoUrl => _photoUrl;
  void setPhotoUrl(String? value) => _photoUrl = Text(value ?? '');

  List<Workout>? get workouts => _workouts;
  void setWorkouts(List<Workout>? value) => _workouts = value;

  CustomerModel({
    required this.id,
    this.createdAt,
    required String name,
    required String email,
    required String phone,
    String? password,
    String? confirmPassword,
    String? photoUrl,
    List<Workout>? workouts,
  })  : _name = Text(name),
        _email = Email(email),
        _phone = Text(phone),
        _password = Text(password ?? ''),
        _confirmPassword = Text(confirmPassword ?? ''),
        _photoUrl = Text(photoUrl ?? ''),
        _workouts = workouts;

  factory CustomerModel.empty() {
    return CustomerModel(id: -1, name: '', email: '', phone: '');
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      photoUrl: json['photoUrl'],
      workouts: json['workouts'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name.toString(),
        'email': email.toString(),
        'phone': phone.toString(),
        'password': password,
        'confirmPassword': confirmPassword,
        'photoUrl': photoUrl,
        'workouts': workouts
      };
}
