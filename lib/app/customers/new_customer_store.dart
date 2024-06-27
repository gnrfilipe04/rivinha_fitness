import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rivinha_fitness/app/services/database.dart';
import 'package:rivinha_fitness/model/customer.dart';
part 'new_customer_store.g.dart';

class NewCustomerStore = _NewCustomerStoreBase with _$NewCustomerStore;

abstract class _NewCustomerStoreBase with Store {
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
    }
  }

  @action
  register() async {
    try {
      var response = await database.createCustomer(customer: customer);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
