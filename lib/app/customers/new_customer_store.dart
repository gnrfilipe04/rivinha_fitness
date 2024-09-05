import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
import 'package:rivinha_fitness/app/services/database.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/routes.dart';
import 'package:routefly/routefly.dart';
part 'new_customer_store.g.dart';

class NewCustomerStore = _NewCustomerStoreBase with _$NewCustomerStore;

abstract class _NewCustomerStoreBase with Store {
  CustomerStore customerStore = provider<CustomerStore>();
  Database database = Database();

  CustomerModel customer = CustomerModel.empty();

  @observable
  File? imageFile;

  @action
  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      customer.setPhotoUrl(pickedImage.path);
    }
  }

  @computed
  bool get hasPhoto => customer.photoUrl.toString().isNotEmpty;

  @action
  register() async {
    try {
      await database.createCustomer(customer: customer);
      Routefly.navigate(routePaths.customers.path);
    } catch (e) {
      print(e);
    }
  }

  @action
  update() async {
    try {
      await database.updateCustomer(customer: customer);
      Routefly.navigate(routePaths.customers.path);
    } catch (e) {
      print(e);
    }
  }
}
