import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/domain/repositories/customer_repository.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/upload_photo.dart';

class CustomerRepositoryMock extends Mock implements CustomerRepository {}

void main() {
  final repository = CustomerRepositoryMock();
  final useCase = UploadCustomerPhotoImpl(repository);
  CustomerModel customer = CustomerModel.empty();

  test('Deve fazer o upload de foto', () async {
    File file = File('path/to/photo');
    when(() => repository.uploadCustomerPhoto(customerId: customer.id, file: file))
        .thenAnswer((_) async => const Right(''));

    final result = await useCase(customerId: customer.id, file: file);
    expect(result, isA<Right>());
  });
}
