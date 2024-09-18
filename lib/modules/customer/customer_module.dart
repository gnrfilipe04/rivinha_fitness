import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:rivinha_fitness/modules/customer/data/repositories/customers_repository_impl.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/create_customer.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/get_customers.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/upload_photo.dart';
import 'package:rivinha_fitness/modules/customer/external/datasources/firebase_datasource.dart';

void registerCustomerModule(GetIt provider) {
  provider.registerLazySingleton(() => FirebaseDataSource(FirebaseFirestore.instance, FirebaseStorage.instance));
  provider.registerLazySingleton(() => CustomersRepositoryImpl(provider<FirebaseDataSource>()));
  provider.registerLazySingleton(() => GetCustomersImpl(provider<CustomersRepositoryImpl>()));
  provider.registerLazySingleton(() => CreateCustomerImpl(provider<CustomersRepositoryImpl>()));
  provider.registerLazySingleton(() => UploadCustomerPhotoImpl(provider<CustomersRepositoryImpl>()));
}
