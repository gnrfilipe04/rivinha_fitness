import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/workout.dart';

abstract class DatabaseInterface {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCustomers();
  Future<DocumentReference<Map<String, dynamic>>> createCustomer(
      {required CustomerModel customer});
  Future<void> updateWorkoutCustomer(
      {required CustomerModel customer, required List<Workout> workouts});
}
