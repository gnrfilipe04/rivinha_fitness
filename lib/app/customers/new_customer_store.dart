import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/app/services/database.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/exercise.dart';
import 'package:rivinha_fitness/model/workout.dart';
import 'package:rivinha_fitness/routes.dart';
import 'package:routefly/routefly.dart';
import 'package:uuid/uuid.dart';
part 'new_customer_store.g.dart';

class NewCustomerStore = _NewCustomerStoreBase with _$NewCustomerStore;

abstract class _NewCustomerStoreBase with Store {
  Database database = Database();
  CustomerModel customer = CustomerModel.empty().copyWith(workouts: [
    Workout(
        id: const Uuid().v4(),
        name: 'Treino A',
        description: 'Treino focado em força',
        exercises: [
          ExerciseModel(
              id: const Uuid().v4(),
              name: 'Supino',
              sets: 4,
              reps: 10,
              startDate: DateTime.now().toIso8601String(),
              endDate: DateTime.now().toIso8601String()),
          ExerciseModel(
              id: const Uuid().v4(),
              name: 'Supino Inclinado',
              sets: 4,
              reps: 10,
              startDate: DateTime.now().toIso8601String(),
              endDate: DateTime.now().toIso8601String()),
        ])
  ]);

  @observable
  File? imageFile;

  @action
  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
  }

  @action
  register() async {
    try {
      await database.createCustomer(customer: customer);
      Routefly.push(routePaths.customers.path);
    } catch (e) {
      print(e);
    }
  }
}
