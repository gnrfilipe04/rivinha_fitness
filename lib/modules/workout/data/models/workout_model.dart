import 'package:rivinha_fitness/modules/workout/data/models/exercise_model.dart';
import 'package:rivinha_fitness/modules/workout/domain/entities/workout.dart';
import 'package:uuid/uuid.dart';

class WorkoutModel extends Workout {
  WorkoutModel({
    required String id,
    required String name,
    required String? description,
    required List<ExerciseModel> exercises,
  }) : super(
          id: id,
          name: name,
          description: description,
          exercises: exercises,
        );

  factory WorkoutModel.empty() {
    return WorkoutModel(id: const Uuid().v4(), name: '', description: '', exercises: []);
  }

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    List<ExerciseModel> exercises = json['exercises'] != null
        ? List<ExerciseModel>.from(json['exercises'].map((ex) => ExerciseModel.fromJson(ex)))
        : [];

    return WorkoutModel(name: json['name'], description: json['description'], id: json['id'], exercises: exercises);
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'description': description, 'id': id, 'exercises': exercises.map((e) => e.toJson()).toList()};

  WorkoutModel copyWith({
    String? id,
    String? name,
    String? description,
    List<ExerciseModel>? exercises,
  }) {
    return WorkoutModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      exercises: exercises ?? this.exercises,
    );
  }
}
