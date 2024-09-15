import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rivinha_fitness/modules/customer/data/datasources/customer_datasource.dart';
import 'package:rivinha_fitness/modules/customer/data/models/customer_model.dart';

class FirebaseDataSource implements CustomerDataSource {
  final FirebaseFirestore firestore;

  FirebaseDataSource(this.firestore);

  @override
  Future<List<CustomerModel>> getCustomers() async {
    final snapshot = await firestore.collection('customers').get();
    return snapshot.docs.map((doc) => CustomerModel.fromJson(doc.data())).toList();
  }
}
