import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/modules/core/services/database.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/get_customers.dart';
import 'package:rivinha_fitness/modules/workout/data/models/workout_model.dart';
part 'customers_store.g.dart';

// ignore: library_private_types_in_public_api
class CustomerStore = _CustomerStoreBase with _$CustomerStore;

abstract class _CustomerStoreBase with Store {
  final GetCustomersImpl getCustomersImpl;

  _CustomerStoreBase(this.getCustomersImpl) {
    getCustomers();
  }

  Database database = Database();

  @action
  getCustomers() async {
    var result = await getCustomersImpl();

    result.fold((l) => print('Falhoou $l'), (r) {
      customers = ObservableList<CustomerModel>.of(r);
    });
  }

  @observable
  ObservableList<CustomerModel> customers = ObservableList<CustomerModel>.of([]);

  @observable
  CustomerModel? selectedCustomer;

  @observable
  late ObservableList<WorkoutModel> workouts =
      ObservableList<WorkoutModel>.of(selectedCustomer == null ? [] : selectedCustomer!.workouts.asMap().values);

  @action
  addWorkout({required WorkoutModel workout}) {
    workouts.add(workout);
    addWorkoutsInCustomer(id: selectedCustomer!.id, workout: workout);
  }

  @action
  addWorkoutsInCustomer({required String? id, required WorkoutModel workout}) async {
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
