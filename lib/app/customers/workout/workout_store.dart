import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/model/exercise.dart';
import 'package:rivinha_fitness/model/workout.dart';
part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStoreBase with _$WorkoutStore;

abstract class _WorkoutStoreBase with Store {
  @observable
  Workout? workoutSelected;

  @action
  void selectWorkout({required Workout workout}) {
    workoutSelected = workout;
  }

  @action
  addExerciseToWorkout({required ExerciseModel exercise}) {
    var exerciseExists = workoutSelected!.exercises
        .firstWhere((element) => element.id == exercise.id);

    if (exerciseExists.id == null) {
      workoutSelected!.exercises.add(exercise);
    } else {
      workoutSelected!.exercises[workoutSelected!.exercises
          .indexWhere((element) => element.id == exercise.id)] = exercise;
    }
  }
}
