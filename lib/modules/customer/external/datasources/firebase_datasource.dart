import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rivinha_fitness/modules/customer/data/datasources/customer_datasource.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';

class FirebaseDataSource implements CustomerDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseDataSource(this._firestore, this._storage);

  @override
  Future<List<CustomerModel>> getCustomers() async {
    final snapshot = await _firestore.collection('customers').get();
    return snapshot.docs.map((doc) => CustomerModel.fromJson(doc.data())).toList();
  }

  @override
  Future<void> createCustomer({required CustomerModel customer}) async {
    return await _firestore.collection('customers').doc(customer.id).set(customer.toJson());
  }

  @override
  Future<String> uploadCustomerPhoto({required File file, required String customerId}) async {
    Reference storageRef = _storage.ref().child('customers/$customerId/photo.jpg');
    UploadTask uploadTask = storageRef.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }
}
