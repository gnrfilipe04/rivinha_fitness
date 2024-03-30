import 'package:rivinha_fitness/model/workout.dart';

class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String country;
  late String? password;
  late String? confirmPassword;
  late String? photoUrl;
  late List<Workout>? workouts;

  Customer(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.city,
      required this.state,
      required this.zip,
      required this.country,
      this.photoUrl,
      this.password,
      this.confirmPassword,
      this.workouts});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        city: json['city'],
        state: json['state'],
        zip: json['zip'],
        country: json['country'],
        password: json['password'],
        confirmPassword: json['confirmPassword'],
        photoUrl: json['photoUrl'],
        workouts: json['workouts']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'city': city,
        'state': state,
        'zip': zip,
        'country': country,
        'password': password,
        'confirmPassword': confirmPassword,
        'photoUrl': photoUrl,
        'workouts': workouts
      };
}
