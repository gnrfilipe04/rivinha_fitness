import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/app/services/database.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/workout.dart';
part 'customers_store.g.dart';

// ignore: library_private_types_in_public_api
class CustomerStore = _CustomerStoreBase with _$CustomerStore;

abstract class _CustomerStoreBase with Store {
  Database database = Database();

  @action
  getCustomers() async {
    database.getCustomers().listen((event) {
      List<CustomerModel> databaseCustomers =
          event.docs.map((e) => CustomerModel.fromJson(e.data()).copyWith(id: e.id)).toList();

      customers = ObservableList<CustomerModel>.of(databaseCustomers);
    });
  }

  @observable
  ObservableList<CustomerModel> customers = ObservableList<CustomerModel>.of([]);

  @observable
  CustomerModel? selectedCustomer;

  @observable
  late ObservableList<Workout> workouts =
      ObservableList<Workout>.of(selectedCustomer == null ? [] : selectedCustomer!.workouts.asMap().values);

  @action
  addWorkout({required Workout workout}) {
    workouts.add(workout);
    addWorkoutsInCustomer(id: selectedCustomer!.id, workout: workout);
  }

  @action
  addWorkoutsInCustomer({required String? id, required Workout workout}) async {
    selectedCustomer?.workouts.add(workout);
    await database.updateCustomer(customer: selectedCustomer!);
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
