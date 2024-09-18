import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/customer/external/datasources/firebase_datasource.dart';

void main() {
  final FakeFirebaseFirestore fakeFirestore = FakeFirebaseFirestore();
  final MockFirebaseStorage mockFirebaseStorage = MockFirebaseStorage();
  CustomerModel customerTest = CustomerModel.empty().copyWith(name: 'João', email: 'joao@example.com');

  test("deve retornar uma lista de CustomerModel com um customer", () async {
    await fakeFirestore.collection('customers').add(customerTest.toJson());

    final datasource = FirebaseDataSource(fakeFirestore, mockFirebaseStorage);

    final customers = await datasource.getCustomers();

    expect(customers, isA<List<CustomerModel>>());
    expect(customers.length, 1);
    expect(customers.first.name.toString(), customerTest.name.toString());
    expect(customers.first.email.toString(), customerTest.email.toString());
  });
}
