// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$emailAtom = Atom(name: '_AuthStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$nameAtom = Atom(name: '_AuthStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: '_AuthStoreBase.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$photoAtom = Atom(name: '_AuthStoreBase.photo', context: context);

  @override
  String get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(String value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  late final _$imageAtom = Atom(name: '_AuthStoreBase.image', context: context);

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$userAtom = Atom(name: '_AuthStoreBase.user', context: context);

  @override
  UserCredential? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserCredential? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$authenticationAsyncAction =
      AsyncAction('_AuthStoreBase.authentication', context: context);

  @override
  Future authentication() {
    return _$authenticationAsyncAction.run(() => super.authentication());
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  dynamic updateUserInfo({required UserCredential user}) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.updateUserInfo');
    try {
      return super.updateUserInfo(user: user);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name},
phoneNumber: ${phoneNumber},
photo: ${photo},
image: ${image},
user: ${user}
    ''';
  }
}
