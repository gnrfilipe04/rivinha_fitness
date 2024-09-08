import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';
import 'package:rivinha_fitness/modules/workout/data/models/workout_model.dart';

abstract class DatabaseInterface {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCustomers();
  Future<void> createCustomer({required CustomerModel customer});
  Future<void> updateWorkoutCustomer({required CustomerModel customer, required List<WorkoutModel> workouts});
  Future<void> updateCustomer({required CustomerModel customer});
  Future<String> uploadPhoto({required File file, required String customerId});
}
