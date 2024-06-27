import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rivinha_fitness/app/services/database_interface.dart';
import 'package:rivinha_fitness/model/customer.dart';

class Database implements DatabaseInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<DocumentReference<Map<String, dynamic>>> createCustomer(
      {required CustomerModel customer}) {
    return _firestore.collection('users').add({
      'name': customer.name.toString(),
      'email': customer.email.toString(),
      'phone': customer.phone.toString(),
    });
  }
}
