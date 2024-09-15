import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rivinha_fitness/modules/customer/data/datasources/customer_datasource.dart';
import 'package:rivinha_fitness/modules/customer/data/errors/datasource_error.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/data/repositories/customers_repository_impl.dart';

class CustomerDataSourceMock extends Mock implements CustomerDataSource {}

void main() {
  final datasource = CustomerDataSourceMock();
  final repository = CustomersRepositoryImpl(datasource);

  test('Deve retornar uma lista de CustomerModel', () async {
    when(() => datasource.getCustomers()).thenAnswer((_) async => <CustomerModel>[]);

    final result = await repository.getCustomers();

    expect(result.fold(id, id), isA<List<CustomerModel>>());
  });

  test('Deve retornar um error se o datasource falhar', () async {
    when(() => datasource.getCustomers()).thenThrow(Exception());

    final result = await repository.getCustomers();

    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
