import 'package:flutter_test/flutter_test.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';

void main() {
  test("Deve retornar um CustomerModel", () async {
    CustomerModel customerTest = CustomerModel.empty().copyWith(
      id: '1',
      name: 'João',
      email: 'joao@example.com',
      phone: '123456789',
    );

    expect(customerTest.id, '1');
    expect(customerTest.name.toString(), 'João');
    expect(customerTest.email.toString(), 'joao@example.com');
    expect(customerTest.phone.toString(), '123456789');
  });

  test("Deve criar uma cópia de CustomerModel", () async {
    CustomerModel customerOriginal = CustomerModel.empty();
    CustomerModel customerCopy = customerOriginal.copyWith();
    expect(customerOriginal.email.toString(), customerCopy.email.toString());
  });
}
