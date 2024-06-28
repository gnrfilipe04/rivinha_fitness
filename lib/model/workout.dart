import 'package:rivinha_fitness/model/exercise.dart';
import 'package:uuid/uuid.dart';

class Workout {
  final String id;
  final String name;
  final String? description;
  final List<ExerciseModel> exercises;

  Workout({
    required this.id,
    required this.name,
    this.description,
    required this.exercises,
  });

  Workout.empty()
      : id = const Uuid().v4(),
        name = '',
        description = '',
        exercises = [];

  factory Workout.fromJson(Map<String, dynamic> json) {
    List<ExerciseModel> exercises = json['exercises'] != null
        ? List<ExerciseModel>.from(
            json['exercises'].map((ex) => ExerciseModel.fromJson(ex)))
        : [];

    return Workout(
        name: json['name'],
        description: json['description'],
        id: json['id'],
        exercises: exercises);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'id': id,
        'exercises': exercises.map((e) => e.toJson()).toList()
      };

  Workout copyWith({
    String? id,
    String? name,
    String? description,
    List<ExerciseModel>? exercises,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      exercises: exercises ?? this.exercises,
    );
  }
}
