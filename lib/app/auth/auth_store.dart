import 'dart:convert';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/routes.dart';
import 'package:routefly/routefly.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final jsonDecoder = const JsonDecoder();
  final jsonEncoder = const JsonEncoder();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CustomerModel customerModel = CustomerModel.empty();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  String phoneNumber = '';

  @observable
  String photo = '';

  @observable
  File? image;

  @observable
  UserCredential? user;

  @action
  authentication() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: '', password: '');

      if (credential.user!.displayName == null) {
        user = credential;
        Routefly.push(routePaths.register);
      }

      print(credential);
    } on FirebaseAuthException catch (e, stackTrace) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.code == 'channel-error') {
        print('Server fail.');
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
    }
  }

  @action
  updateUserInfo({required UserCredential user}) {
    print(user);
  }

  @action
  forceCrash() {
    FirebaseCrashlytics.instance.crash();
  }
}
