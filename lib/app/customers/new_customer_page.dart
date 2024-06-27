import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/new_customer_store.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';

class NewCustomerPage extends StatefulWidget {
  const NewCustomerPage({super.key});

  @override
  State<NewCustomerPage> createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  NewCustomerStore store = provider<NewCustomerStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('Novo aluno'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => {
              store.imageFile = null,
              store.customer = CustomerModel.empty(),
              Navigator.of(context).pop()
            },
          ),
        ),
        body: Observer(
          builder: (_) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: Column(
                children: <Widget>[
                  FormField(builder: (state) {
                    return GestureDetector(
                      onTap: () => store.getImage(),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: MyColors.gray100,
                          borderRadius: BorderRadius.circular(75),
                        ),
                        child: Observer(
                            builder: (_) => store.imageFile == null
                                ? const Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                    color: MyColors.gray500,
                                  )
                                : CircleAvatar(
                                    radius: 75,
                                    backgroundImage:
                                        FileImage(store.imageFile!))),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (v) => store.customer.setName(v),
                    validator: (v) => store.customer.name.validator(),
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (v) => store.customer.setPhone(v),
                    validator: (v) => store.customer.phone.validator(),
                    decoration: const InputDecoration(
                      labelText: 'Celular',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormField(builder: (state) {
                    return TextFormField(
                      onChanged: (v) => store.customer.setEmail(v),
                      validator: (v) => store.customer.email.validator(),
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => store.register(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.green500,
                      minimumSize: const Size.fromHeight(60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Concluir cadastro',
                      style: TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
