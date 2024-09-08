import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/modules/core/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/workout/workout_store.dart';
import 'package:rivinha_fitness/modules/core/config/routes.dart';
import 'package:rivinha_fitness/modules/workout/data/models/exercise_model.dart';
import 'package:routefly/routefly.dart';
import 'package:uuid/uuid.dart';
part 'new_exercise_store.g.dart';

class NewExerciseStore = _NewExerciseStoreBase with _$NewExerciseStore;

abstract class _NewExerciseStoreBase with Store {
  final WorkoutStore workoutStore = provider<WorkoutStore>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @observable
  late File? image;

  @action
  getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  @action
  createNewExercise() {
    ExerciseModel newExercise = ExerciseModel(
      id: const Uuid().v4(),
      name: nameController.text,
      sets: int.tryParse(setsController.text),
      reps: int.tryParse(repsController.text),
      description: descriptionController.text,
      image: image!.path,
    );
    workoutStore.addExerciseToWorkout(exercise: newExercise);
    Routefly.push(routePaths.customers.path);
  }
}
