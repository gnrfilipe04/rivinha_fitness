import 'package:routefly/routefly.dart';

import '../../../app/app_page.dart' as a0;
import '../../../app/auth/auth_page.dart' as a1;
import '../../../app/customers/[id]_page.dart' as a7;
import '../../../app/customers/customers_page.dart' as a2;
import '../../../app/customers/new_customer_page.dart' as a3;
import '../../../app/customers/workout/[workout]_page.dart' as a6;
import '../../../app/customers/workout/exercise/[item]_page.dart' as a5;
import '../../../app/customers/workout/exercise/new_exercise_page.dart' as a4;
import '../../../app/home/home_page.dart' as a8;
import '../../../app/register/register_page.dart' as a9;

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
        key: '/auth',
        uri: Uri.parse('/auth'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a1.AuthPage(),
        ),
      ),
      RouteEntity(
        key: '/customers',
        uri: Uri.parse('/customers'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a2.CustomersPage(),
        ),
      ),
      RouteEntity(
        key: '/customers/new_customer',
        uri: Uri.parse('/customers/new_customer'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a3.NewCustomerPage(),
        ),
      ),
      RouteEntity(
        key: '/customers/workout/exercise/new_exercise',
        uri: Uri.parse('/customers/workout/exercise/new_exercise'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a4.NewExercise(),
        ),
      ),
      RouteEntity(
        key: '/customers/workout/exercise/[item]',
        uri: Uri.parse('/customers/workout/exercise/[item]'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a5.ExercisePage(),
        ),
      ),
      RouteEntity(
        key: '/customers/workout/[workout]',
        uri: Uri.parse('/customers/workout/[workout]'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a6.CustomerWorkoutPage(),
        ),
      ),
      RouteEntity(
        key: '/customers/[id]',
        uri: Uri.parse('/customers/[id]'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a7.CustomerPage(),
        ),
      ),
      RouteEntity(
        key: '/home',
        uri: Uri.parse('/home'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a8.MyHomePage(),
        ),
      ),
      RouteEntity(
        key: '/register',
        uri: Uri.parse('/register'),
        routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
          ctx,
          settings,
          const a9.RegisterPage(),
        ),
      ),
    ];

const routePaths = (
  path: '/',
  auth: '/auth',
  customers: (
    path: '/customers',
    newCustomer: '/customers/new_customer',
    workout: (
      path: '/customers/workout',
      exercise: (
        path: '/customers/workout/exercise',
        newExercise: '/customers/workout/exercise/new_exercise',
        $item: '/customers/workout/exercise/[item]',
      ),
      $workout: '/customers/workout/[workout]',
    ),
    $id: '/customers/[id]',
  ),
  home: '/home',
  register: '/register',
);
