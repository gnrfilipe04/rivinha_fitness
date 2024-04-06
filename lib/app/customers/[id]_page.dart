import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
import 'package:rivinha_fitness/app/widgets/list_item.dart';
import 'package:rivinha_fitness/routes.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';
import 'package:routefly/routefly.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final CustomerStore store = provider<CustomerStore>();
  final jsonEncoder = const JsonEncoder();

  @override
  void initState() {
    store.setSelectedCustomer(id: Routefly.query['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                print('Editar cliente');
              },
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: MyColors.green700,
                              child: Text(
                                'C1',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.selectedCustomer!.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(store.selectedCustomer!.email,
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.data_exploration),
                          onPressed: () {
                            print('Editar cliente');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Treinos', style: TextStyle(fontSize: 20)),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  print('Adicionar treino');
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () {
                                  print('Adicionar treino');
                                },
                              ),
                            ],
                          ),
                        ]),
                    const SizedBox(height: 20),
                    ...store.selectedCustomer!.workouts!.map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: ListItem(
                            title: e.name,
                            description: e.description ?? 'Sem descrição',
                            onTap: () {
                              Routefly.push(routePaths
                                  .customers.workout.$workout
                                  .changes({
                                'workout': jsonEncoder.convert(e),
                              }));
                            },
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
