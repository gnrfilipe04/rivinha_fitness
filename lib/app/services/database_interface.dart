import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/workout.dart';

abstract class DatabaseInterface {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCustomers();
  Future<void> createCustomer({required CustomerModel customer});
  Future<void> updateWorkoutCustomer(
      {required CustomerModel customer, required List<Workout> workouts});
  Future<void> updateCustomer({required CustomerModel customer});
  Future<String> uploadPhoto({required File file, required String customerId});
}
