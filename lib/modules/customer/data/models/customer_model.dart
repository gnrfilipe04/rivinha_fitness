import 'package:rivinha_fitness/modules/customer/domain/entities/customer.dart';
import 'package:rivinha_fitness/modules/workout/data/models/workout_model.dart';
import 'package:uuid/uuid.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required String id,
    DateTime? createdAt,
    required String name,
    required String email,
    required String? phone,
    String? password,
    String? confirmPassword,
    String? photoUrl,
    required List<WorkoutModel> workouts,
  }) : super(
          id: id,
          createdAt: createdAt,
          name: name,
          email: email,
          phone: phone,
          password: password,
          confirmPassword: confirmPassword,
          photoUrl: photoUrl,
          workouts: workouts,
        );

  factory CustomerModel.empty() {
    return CustomerModel(id: const Uuid().v4(), name: '', email: '', phone: '', workouts: []);
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> workouts = json['workouts'];
    List<WorkoutModel> workoutsList =
        workouts.map((workout) => WorkoutModel.fromJson(workout)).toList().cast<WorkoutModel>();

    return CustomerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      photoUrl: json['photoUrl'],
      workouts: workoutsList,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name.toString(),
        'email': email.toString(),
        'phone': phone.toString(),
        'photoUrl': photoUrl.toString(),
        'workouts': workouts.map((e) => e.toJson()).toList()
      };

  CustomerModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    String? photoUrl,
    List<WorkoutModel>? workouts,
    DateTime? createdAt,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name.toString(),
      email: email ?? this.email.toString(),
      phone: phone ?? this.phone.toString(),
      password: password ?? this.password.toString(),
      confirmPassword: confirmPassword ?? this.confirmPassword.toString(),
      photoUrl: photoUrl ?? this.photoUrl.toString(),
      workouts: workouts ?? this.workouts,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
