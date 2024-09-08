import 'package:rivinha_fitness/modules/workout/data/models/exercise_model.dart';

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
}
