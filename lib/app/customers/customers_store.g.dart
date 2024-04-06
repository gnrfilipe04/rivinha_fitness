// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerStore on _CustomerStoreBase, Store {
  late final _$customersAtom =
      Atom(name: '_CustomerStoreBase.customers', context: context);

  @override
  List<CustomerModel> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(List<CustomerModel> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$selectedCustomerAtom =
      Atom(name: '_CustomerStoreBase.selectedCustomer', context: context);

  @override
  CustomerModel? get selectedCustomer {
    _$selectedCustomerAtom.reportRead();
    return super.selectedCustomer;
  }

  @override
  set selectedCustomer(CustomerModel? value) {
    _$selectedCustomerAtom.reportWrite(value, super.selectedCustomer, () {
      super.selectedCustomer = value;
    });
  }

  late final _$_CustomerStoreBaseActionController =
      ActionController(name: '_CustomerStoreBase', context: context);

  @override
  dynamic setSelectedCustomer({required int id}) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setSelectedCustomer');
    try {
      return super.setSelectedCustomer(id: id);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customers: ${customers},
selectedCustomer: ${selectedCustomer}
    ''';
  }
}
