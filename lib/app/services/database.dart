import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rivinha_fitness/app/services/database_interface.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/workout.dart';

class Database implements DatabaseInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getCustomers() {
    return _firestore.collection('customers').snapshots();
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> createCustomer(
      {required CustomerModel customer}) async {
    return await _firestore.collection('customers').add(customer.toJson());
  }

  @override
  Future<void> updateWorkoutCustomer(
      {required CustomerModel customer,
      required List<Workout> workouts}) async {
    return await _firestore
        .collection('customers')
        .doc(customer.id.toString())
        .update({
      'workouts': workouts,
    });
  }
}
