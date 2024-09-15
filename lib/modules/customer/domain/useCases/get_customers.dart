import 'package:dartz/dartz.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/domain/entities/customer.dart';
import 'package:rivinha_fitness/modules/customer/domain/errors/errors.dart';
import 'package:rivinha_fitness/modules/customer/domain/repositories/customer_repository.dart';

abstract class GetCustomers {
  Future<Either<FailureCustomers, List<Customer>>> call();
}

class GetCustomersImpl implements GetCustomers {
  final CustomerRepository repository;

  GetCustomersImpl(this.repository);

  @override
  Future<Either<FailureCustomers, List<CustomerModel>>> call() async {
    return repository.getCustomers();
  }
}
