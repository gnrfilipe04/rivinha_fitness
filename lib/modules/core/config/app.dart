import 'package:flutter/material.dart';
import 'package:rivinha_fitness/modules/core/config/routes.dart';
import 'package:rivinha_fitness/app/theme/my_theme.dart';
import 'package:routefly/routefly.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme,
      routerConfig: Routefly.routerConfig(routes: routes, initialPath: routePaths.customers.path),
    );
  }
}
