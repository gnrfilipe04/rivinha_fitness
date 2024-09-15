import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/domain/repositories/customer_repository.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/get_customers.dart';

class CustomerRepositoryMock extends Mock implements CustomerRepository {}

void main() {
  final repository = CustomerRepositoryMock();

  final useCase = GetCustomersImpl(repository);

  test('Deve retornar uma lista de CustomerModel', () async {
    when(() => repository.getCustomers()).thenAnswer((_) async => const Right(<CustomerModel>[]));

    final result = await useCase();
    expect(result, isA<Right>());
  });
}
