import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
import 'package:rivinha_fitness/app/customers/new_customer_store.dart';
import 'package:rivinha_fitness/model/customer.dart';
import 'package:rivinha_fitness/routes.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';
import 'package:routefly/routefly.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  CustomerStore customerStore = provider<CustomerStore>();
  NewCustomerStore newCustomerStore = provider<NewCustomerStore>();

  @override
  void initState() {
    customerStore.getCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Clientes'),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print('Pesquisar cliente');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    print('Deslogar');
                  },
                )
              ],
            ),
            body: Visibility(
                visible: customerStore.customers.isNotEmpty,
                replacement: const Center(
                  child: Text('Nenhum cliente cadastrado'),
                ),
                child: ListView.builder(
                  itemCount: customerStore.customers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            customerStore.customers[index].name.toString()),
                        leading: CircleAvatar(
                          backgroundColor: MyColors.green500,
                          backgroundImage: NetworkImage(customerStore
                              .customers[index].photoUrl
                              .toString()),
                          child: customerStore.customers[index].photoUrl
                                  .toString()
                                  .isEmpty
                              ? Text(
                                  customerStore.customers[index].name
                                      .toString()
                                      .substring(0, 2)
                                      .toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                )
                              : Container(),
                        ),
                        subtitle: Text(
                          customerStore.customers[index].email.toString(),
                          style: const TextStyle(color: MyColors.gray100),
                        ),
                        trailing: Icon(Icons.adaptive.arrow_forward),
                        onTap: () {
                          var customerToEdit = customerStore.customers[index];

                          Routefly.push(routePaths.customers.$id
                              .changes({'id': customerToEdit.id}));
                        },
                      ),
                    );
                  },
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                CustomerModel customer = CustomerModel.empty();
                customerStore.selectedCustomer = customer;
                newCustomerStore.customer = customer;

                Routefly.push(routePaths.customers.newCustomer);
              },
              child: const Icon(Icons.add),
            )));
  }
}
