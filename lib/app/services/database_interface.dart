import 'package:rivinha_fitness/model/customer.dart';

abstract class DatabaseInterface {
  dynamic createCustomer({required CustomerModel customer});
}
