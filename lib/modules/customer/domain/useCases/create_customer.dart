import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/domain/errors/errors.dart';
import 'package:rivinha_fitness/modules/customer/domain/repositories/customer_repository.dart';

abstract class CreateCustomer {
  Future<Either<FailureCustomers, void>> call({required CustomerModel customer});
}

class CreateCustomerImpl implements CreateCustomer {
  final CustomerRepository repository;

  CreateCustomerImpl(this.repository);

  @override
  Future<Either<FailureCustomers, void>> call({required CustomerModel customer}) async {
    String? photoUrl;

    if (customer.photoUrl != null && customer.photoUrl.toString().isNotEmpty) {
      var uploadResult =
          await repository.uploadCustomerPhoto(file: File(customer.photoUrl.toString()), customerId: customer.id);

      uploadResult.fold((l) => Left(l), (r) => photoUrl = r);
    }

    return repository.createCustomer(customer: customer.copyWith(photoUrl: photoUrl));
  }
}
