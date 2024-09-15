import 'package:dartz/dartz.dart';
import 'package:rivinha_fitness/modules/customer/data/datasources/customer_datasource.dart';
import 'package:rivinha_fitness/modules/customer/data/errors/datasource_error.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/domain/errors/errors.dart';
import 'package:rivinha_fitness/modules/customer/domain/repositories/customer_repository.dart';

class CustomersRepositoryImpl implements CustomerRepository {
  final CustomerDataSource customerSource;

  CustomersRepositoryImpl(this.customerSource);

  @override
  Future<Either<FailureCustomers, List<CustomerModel>>> getCustomers() async {
    try {
      final result = await customerSource.getCustomers();
      return Right(result);
    } catch (e) {
      return Left(DataSourceError(message: 'Erro ao buscar os clientes'));
    }
  }
}
