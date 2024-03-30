import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
import 'package:rivinha_fitness/app/home/home_store.dart';

GetIt provider = GetIt.instance;

Future<void> setupProvider() async {
  provider.registerSingleton<HomeStore>(HomeStore());
  provider.registerSingleton<CustomerStore>(CustomerStore());
}

Future<void> setupApp() async {
  await setupProvider();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}
