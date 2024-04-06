import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/workout/workout_store.dart';
import 'package:rivinha_fitness/model/exercise.dart';
import 'package:rivinha_fitness/routes.dart';
import 'package:routefly/routefly.dart';
part 'new_exercise_store.g.dart';

class NewExerciseStore = _NewExerciseStoreBase with _$NewExerciseStore;

abstract class _NewExerciseStoreBase with Store {
  final WorkoutStore workoutStore = provider<WorkoutStore>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @observable
  late File image;

  @action
  getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  @action
  createNewExercise({required ExerciseModel exercise}) {
    workoutStore.addExerciseToWorkout(exercise: exercise);
    Routefly.push(routePaths.customers.path);
  }
}
