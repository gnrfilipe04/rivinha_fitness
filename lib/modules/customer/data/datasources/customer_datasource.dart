import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';

abstract class CustomerDataSource {
  Future<List<CustomerModel>> getCustomers();
}
