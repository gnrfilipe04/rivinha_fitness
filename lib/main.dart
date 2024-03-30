import 'package:flutter/material.dart';
import 'package:rivinha_fitness/app/config/app.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';

Future<void> main() async {
  await setupApp();

  runApp(const App());
}
