import 'dart:io';

import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:dartz/dartz.dart';
import 'package:rivinha_fitness/modules/customer/domain/errors/errors.dart';

abstract class CustomerRepository {
  Future<Either<FailureCustomers, List<CustomerModel>>> getCustomers();
  Future<Either<FailureCustomers, void>> createCustomer({required CustomerModel customer});
  Future<Either<FailureCustomers, String>> uploadCustomerPhoto({required File file, required String customerId});
}
