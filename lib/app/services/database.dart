import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rivinha_fitness/app/services/database_interface.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/model/workout.dart';
import 'package:uuid/uuid.dart';

class Database implements DatabaseInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getCustomers() {
    return _firestore.collection('customers').snapshots();
  }

  @override
  Future<void> createCustomer({required CustomerModel customer}) async {
    String photoUrl = '';
    var uuid = const Uuid().v4();

    if (customer.photoUrl != null && customer.photoUrl.toString().isNotEmpty) {
      photoUrl = await uploadPhoto(file: File(customer.photoUrl.toString()), customerId: uuid);
    }

    return await _firestore
        .collection('customers')
        .doc(uuid)
        .set(customer.copyWith(id: uuid, photoUrl: photoUrl).toJson());
  }

  @override
  Future<void> updateWorkoutCustomer({required CustomerModel customer, required List<Workout> workouts}) async {
    return await _firestore.collection('customers').doc(customer.id.toString()).update({
      'workouts': workouts,
    });
  }

  @override
  Future<void> updateCustomer({required CustomerModel customer}) async {
    String photoUrl = customer.photoUrl.toString();

    if (customer.photoUrl != null && customer.photoUrl.toString().isNotEmpty) {
      if (!customer.photoUrl.toString().contains('firebase')) {
        photoUrl = await uploadPhoto(file: File(customer.photoUrl.toString()), customerId: customer.id);
      }
    }

    var customerToUpdate = customer.copyWith(photoUrl: photoUrl).toJson();

    return await _firestore.collection('customers').doc(customer.id.toString()).update(customerToUpdate);
  }

  @override
  Future<String> uploadPhoto({required File file, required String customerId}) async {
    Reference storageRef = _storage.ref().child('customers/$customerId/photo.jpg');
    UploadTask uploadTask = storageRef.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }
}
