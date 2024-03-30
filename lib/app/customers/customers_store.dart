import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/model/Customer.dart';
part 'customers_store.g.dart';

class CustomerStore = _CustomerStoreBase with _$CustomerStore;

abstract class _CustomerStoreBase with Store {
  List<Customer> customers = [
    Customer(
        id: '0',
        name: 'João',
        email: 'teste@joao.com',
        phone: '123456789',
        address: 'Rua 1',
        city: 'Cidade 1',
        state: 'Estado 1',
        zip: '123456',
        country: 'País 1'),
    Customer(
        id: '1',
        name: 'Maria',
        email: 'teste@teste.com',
        phone: '987654321',
        address: 'Rua 2',
        city: 'Cidade 2',
        state: 'Estado 2',
        zip: '654321',
        country: 'País 2'),
  ];

  @action
  findCustomerById(int id) {
    return customers.firstWhere((element) => element.id == id.toString());
  }
}
