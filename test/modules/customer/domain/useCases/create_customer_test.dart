import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/domain/repositories/customer_repository.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/create_customer.dart';

class CustomerModelMock extends Mock implements CustomerModel {}

class CustomerRepositoryMock extends Mock implements CustomerRepository {}

class MockFile extends Mock implements File {}

void main() {
  final repository = CustomerRepositoryMock();
  final useCase = CreateCustomerImpl(repository);
  late CustomerModel customer;

  setUpAll(() {
    customer = CustomerModel.empty();
    registerFallbackValue(MockFile());
    registerFallbackValue(CustomerModelMock());
  });

  test('Deve inserir usuário sem foto', () async {
    when(() => repository.createCustomer(customer: any<CustomerModelMock>(named: 'customer')))
        .thenAnswer((_) async => const Right(null));

    final result = await useCase(customer: customer);
    expect(result, isA<Right>());
  });

  test('Deve inserir usuário com foto', () async {
    CustomerModel customerWithPhoto = customer.copyWith(photoUrl: 'path/to/photo');

    when(() => repository.uploadCustomerPhoto(
        customerId: any<String>(named: 'customerId'),
        file: any<MockFile>(named: 'file'))).thenAnswer((_) async => const Right('photo_url'));

    when(() => repository.createCustomer(customer: any<CustomerModelMock>(named: 'customer')))
        .thenAnswer((_) async => const Right(null));

    final result = await useCase(customer: customerWithPhoto);
    expect(result, isA<Right>());
  });
}
