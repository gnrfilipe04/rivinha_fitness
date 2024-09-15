import 'package:flutter_test/flutter_test.dart';
import 'package:rivinha_fitness/modules/customer/domain/entities/customer.dart';

void main() {
  late Customer customer =
      Customer(id: '1', name: '', email: '', phone: '', password: '', confirmPassword: '', photoUrl: '', workouts: []);

  test("Deve inserir name na entidade", () async {
    customer.setName('customer name');

    expect(customer.name.toString(), 'customer name');
  });

  test("Deve inserir email na entidade", () async {
    customer.setEmail('customer@teste.com');

    expect(customer.email.toString(), 'customer@teste.com');
  });

  test("Deve inserir phone na entidade", () async {
    customer.setPhone('123456789');

    expect(customer.phone.toString(), '123456789');
  });

  test("Deve inserir password na entidade", () async {
    customer.setPassword('123456');

    expect(customer.password.toString(), '123456');
  });

  test("Deve inserir password na entidade", () async {
    customer.setConfirmPassword('123456');

    expect(customer.confirmPassword.toString(), '123456');
  });

  test("Deve inserir photo na entidade", () async {
    customer.setPhotoUrl('url');

    expect(customer.photoUrl.toString(), 'url');
  });

  test("Deve inserir workouts na entidade", () async {
    customer.setWorkouts([]);

    expect(customer.workouts.length, 0);
  });
}
