import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
import 'package:rivinha_fitness/app/customers/workout/workout_store.dart';
import 'package:rivinha_fitness/app/home/home_store.dart';
import 'package:rivinha_fitness/firebase_options.dart';

GetIt provider = GetIt.instance;

Future<void> setupProvider() async {
  provider.registerSingleton<HomeStore>(HomeStore());
  provider.registerSingleton<CustomerStore>(CustomerStore());
  provider.registerSingleton<WorkoutStore>(WorkoutStore());
}

Future<void> setupApp() async {
  await setupProvider();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}
