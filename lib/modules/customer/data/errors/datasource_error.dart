import 'package:rivinha_fitness/modules/customer/domain/errors/errors.dart';

class DataSourceError implements FailureCustomers {
  final String message;

  DataSourceError({required this.message});
}
