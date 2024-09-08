import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/modules/workout/data/models/exercise_model.dart';
import 'package:rivinha_fitness/modules/workout/data/models/workout_model.dart';
part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStoreBase with _$WorkoutStore;

abstract class _WorkoutStoreBase with Store {
  @observable
  WorkoutModel? workoutSelected;

  @action
  void selectWorkout({required WorkoutModel workout}) {
    workoutSelected = workout;
  }

  @action
  addExerciseToWorkout({required ExerciseModel exercise}) {
    ExerciseModel? exerciseExists = workoutSelected?.exercises.firstWhere((element) => element.id == exercise.id);

    if (exerciseExists == null) {
      workoutSelected?.exercises.add(exercise);
    } else {
      workoutSelected?.exercises[workoutSelected!.exercises.indexWhere((element) => element.id == exercise.id)] =
          exercise;
    }
  }
}
