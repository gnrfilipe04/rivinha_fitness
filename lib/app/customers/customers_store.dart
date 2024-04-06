import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/model/exercise.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/workout.dart';
part 'customers_store.g.dart';

// ignore: library_private_types_in_public_api
class CustomerStore = _CustomerStoreBase with _$CustomerStore;

abstract class _CustomerStoreBase with Store {
  @observable
  List<CustomerModel> customers = [
    CustomerModel(
        id: 0,
        name: 'João',
        email: 'teste@joao.com',
        phone: '123456789',
        address: 'Rua 1',
        city: 'Cidade 1',
        state: 'Estado 1',
        zip: '123456',
        country: 'País 1',
        workouts: [
          Workout(
              id: 0,
              name: 'Treino A',
              description: 'Treino focado em força',
              exercises: [
                ExerciseModel(
                    name: 'Supino',
                    sets: '4',
                    reps: '10',
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().toIso8601String()),
                ExerciseModel(
                    name: 'Supino Inclinado',
                    sets: '4',
                    reps: '10',
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().toIso8601String()),
              ])
        ]),
    CustomerModel(
        id: 1,
        name: 'Maria',
        email: 'teste@teste.com',
        phone: '987654321',
        address: 'Rua 2',
        city: 'Cidade 2',
        state: 'Estado 2',
        zip: '654321',
        country: 'País 2',
        workouts: [
          Workout(
              id: 0,
              name: 'Treino A',
              description: 'Treino focado em mobilidade',
              exercises: [
                ExerciseModel(
                    name: 'Supino',
                    sets: '4',
                    reps: '10',
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().toIso8601String()),
                ExerciseModel(
                    name: 'Supino Inclinado',
                    sets: '4',
                    reps: '10',
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().toIso8601String()),
              ]),
          Workout(
              id: 0,
              name: 'Treino A',
              description: 'Treino focado em mobilidade',
              exercises: [
                ExerciseModel(
                    name: 'Supino',
                    sets: '4',
                    reps: '10',
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().toIso8601String()),
                ExerciseModel(
                    name: 'Supino Inclinado',
                    sets: '4',
                    reps: '12',
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().toIso8601String()),
              ]),
        ]),
  ];

  @observable
  CustomerModel? selectedCustomer;

  @action
  setSelectedCustomer({required int id}) {
    selectedCustomer = customers.firstWhere((element) => element.id == id);
  }
}
