import 'dart:io';

import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';

abstract class CustomerDataSource {
  Future<List<CustomerModel>> getCustomers();
  Future<void> createCustomer({required CustomerModel customer});
  Future<String> uploadCustomerPhoto({required File file, required String customerId});
}
