import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/customers_store.dart';
import 'package:rivinha_fitness/app/widgets/list_item.dart';
import 'package:rivinha_fitness/model/workout.dart';
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
    var customerId = Routefly.query['id'];
    store.setSelectedCustomer(id: customerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Routefly.push(routePaths.customers.newCustomer);
                  },
                ),
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: MyColors.green700,
                                  backgroundImage: NetworkImage(store.selectedCustomer!.photoUrl.toString()),
                                  child: store.selectedCustomer!.photoUrl.toString().isEmpty
                                      ? Text(
                                          store.selectedCustomer?.name.toString().substring(0, 2).toUpperCase() ?? '',
                                          style: const TextStyle(color: Colors.white),
                                        )
                                      : Container(),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      store.selectedCustomer!.name.toString(),
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    Text(store.selectedCustomer!.email.toString(),
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
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          const Text('Treinos', style: TextStyle(fontSize: 20)),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Adicionar treino',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actionsAlignment: MainAxisAlignment.center,
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Workout newWorkout = Workout.empty();
                                                store.addWorkout(
                                                    workout: newWorkout.copyWith(
                                                  name: 'Treino ${store.workouts.length + 1}',
                                                  description: 'Treino sem descrição',
                                                ));
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: MyColors.green500,
                                                minimumSize: const Size.fromHeight(60),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: const Text(
                                                'Criar Treino',
                                                style: TextStyle(
                                                    color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: ElevatedButton(
                                                onPressed: () => Navigator.pop(context),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: MyColors.gray300,
                                                  minimumSize: const Size.fromHeight(60),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Cancelar',
                                                  style: TextStyle(
                                                      color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          ],
                                          content: const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                decoration: InputDecoration(labelText: 'Nome do treino'),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(labelText: 'Objetivo'),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
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
                        Visibility(
                          visible: store.workouts.isNotEmpty,
                          replacement: const Center(
                            child: Text('Nenhum treino cadastrado'),
                          ),
                          child: Column(
                            children: store.workouts
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: ListItem(
                                        title: e.name,
                                        description: e.description ?? 'Sem descrição',
                                        onTap: () {
                                          Routefly.push(routePaths.customers.workout.$workout.changes({
                                            'workout': jsonEncoder.convert(e),
                                          }));
                                        },
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
