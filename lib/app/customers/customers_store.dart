import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/app/services/database.dart';
import 'package:rivinha_fitness/model/exercise.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/workout.dart';
import 'package:uuid/uuid.dart';
part 'customers_store.g.dart';

// ignore: library_private_types_in_public_api
class CustomerStore = _CustomerStoreBase with _$CustomerStore;

abstract class _CustomerStoreBase with Store {
  Database database = Database();

  @action
  getCustomers() async {
    database.getCustomers().listen((event) {
      List<CustomerModel> databaseCustomers = event.docs
          .map((e) => CustomerModel.fromJson(e.data()).copyWith(id: e.id))
          .toList();

      customers = databaseCustomers;
    });
  }

  @observable
  List<CustomerModel> customers = [
    CustomerModel(
        id: '0',
        name: 'João',
        email: 'teste@joao.com',
        phone: '123456789',
        workouts: [
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
        ]),
    CustomerModel(
        id: '1',
        name: 'Maria',
        email: 'teste@teste.com',
        phone: '987654321',
        workouts: [
          Workout(
              id: '0',
              name: 'Treino A',
              description: 'Treino focado em mobilidade',
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
              ]),
          Workout(
              id: '0',
              name: 'Treino A',
              description: 'Treino focado em mobilidade',
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
                    reps: 12,
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().toIso8601String()),
              ]),
        ]),
  ];

  @observable
  CustomerModel? selectedCustomer;

  @observable
  late ObservableList<Workout> workouts = ObservableList<Workout>.of(
      selectedCustomer == null
          ? []
          : selectedCustomer!.workouts.asMap().values);

  @action
  addWorkout({required Workout workout}) {
    workouts.add(workout);
    addWorkoutsInCustomer(id: selectedCustomer!.id, workout: workout);
  }

  @action
  addWorkoutsInCustomer({required String? id, required Workout workout}) {
    customers.firstWhere((element) => element.id == id).workouts.add(workout);
  }

  @computed
  bool get hasSelectedCustomer => selectedCustomer != null;

  @computed
  bool get hasWorkouts => workouts.isNotEmpty;

  @action
  setSelectedCustomer({required String id}) {
    selectedCustomer = customers.firstWhere((element) => element.id == id);
  }
}
