import 'package:flutter/material.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clientes'),
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
        body: ListView.builder(
          itemCount: customerStore.customers.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(customerStore.customers[index].name.toString()),
                leading: CircleAvatar(
                  backgroundColor: MyColors.green500,
                  child: Text(
                    'C$index',
                    style: const TextStyle(color: MyColors.gray100),
                  ),
                ),
                subtitle: Text(
                  customerStore.customers[index].email.toString(),
                  style: const TextStyle(color: MyColors.gray100),
                ),
                trailing: Icon(Icons.adaptive.arrow_forward),
                onTap: () {
                  Routefly.push(routePaths.customers.$id
                      .changes({'id': index.toString()}));
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Adicionar cliente');
          },
          child: const Icon(Icons.add),
        ));
  }
}
