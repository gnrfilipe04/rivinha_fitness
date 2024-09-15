import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rivinha_fitness/app/auth/auth_store.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
import 'package:rivinha_fitness/app/customers/new_customer_store.dart';
import 'package:rivinha_fitness/app/customers/workout/workout_store.dart';
import 'package:rivinha_fitness/app/home/home_store.dart';
import 'package:rivinha_fitness/firebase_options.dart';
import 'package:rivinha_fitness/modules/customer/customer_module.dart';
import 'package:rivinha_fitness/modules/customer/domain/useCases/get_customers.dart';

GetIt provider = GetIt.instance;

Future<void> setupProvider() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  provider.registerSingleton<FirebaseApp>(firebaseApp);
  provider.registerSingleton<AuthStore>(AuthStore());
  provider.registerSingleton<HomeStore>(HomeStore());
  registerCustomerModule(provider);
  provider.registerSingleton<CustomerStore>(CustomerStore(provider<GetCustomersImpl>()));
  provider.registerSingleton<WorkoutStore>(WorkoutStore());
  provider.registerSingleton<NewCustomerStore>(NewCustomerStore());
}

Future<void> setupApp() async {
  await setupProvider();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));
}
