import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/customers/[id]_page.dart' as a2;
import 'app/customers/customers_page.dart' as a1;
import 'app/home/home_page.dart' as a3;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.AppPage(),
    ),
  ),
  RouteEntity(
    key: '/customers',
    uri: Uri.parse('/customers'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.CustomersPage(),
    ),
  ),
  RouteEntity(
    key: '/customers/[id]',
    uri: Uri.parse('/customers/[id]'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.CustomerPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.MyHomePage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  customers: (
    path: '/customers',
    $id: '/customers/[id]',
  ),
  home: '/home',
);
