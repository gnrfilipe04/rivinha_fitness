import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rivinha_fitness/modules/customer/domain/errors/errors.dart';
import 'package:rivinha_fitness/modules/customer/domain/repositories/customer_repository.dart';

abstract class UploadCustomerPhoto {
  Future<Either<FailureCustomers, String>> call({required File file, required String customerId});
}

class UploadCustomerPhotoImpl implements UploadCustomerPhoto {
  final CustomerRepository repository;

  UploadCustomerPhotoImpl(this.repository);

  @override
  Future<Either<FailureCustomers, String>> call({required File file, required String customerId}) async {
    return repository.uploadCustomerPhoto(file: file, customerId: customerId);
  }
}
