import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rivinha_fitness/modules/core/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/workout/workout_store.dart';
import 'package:rivinha_fitness/app/widgets/list_item.dart';
import 'package:rivinha_fitness/modules/core/config/routes.dart';
import 'package:rivinha_fitness/modules/workout/data/models/workout_model.dart';
import 'package:routefly/routefly.dart';

class CustomerWorkoutPage extends StatefulWidget {
  const CustomerWorkoutPage({super.key});

  @override
  State<CustomerWorkoutPage> createState() => _CustomerWorkoutPageState();
}

class _CustomerWorkoutPageState extends State<CustomerWorkoutPage> {
  final jsonDecoder = const JsonDecoder();
  final jsonEncoder = const JsonEncoder();
  final WorkoutStore store = provider<WorkoutStore>();

  @override
  void initState() {
    var paramValue = Routefly.query['workout'];
    var workoutExists = paramValue != null;

    if (workoutExists) {
      WorkoutModel workout = WorkoutModel.fromJson(jsonDecoder.convert(paramValue));
      store.selectWorkout(workout: workout);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(store.workoutSelected?.name ?? 'Treino do cliente'),
          actions: [
            IconButton(
              icon: const Icon(Icons.print_outlined),
              onPressed: () {
                print('Editar cliente');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(store.workoutSelected!.description ?? 'Sem descrição',
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                ),
                ...store.workoutSelected!.exercises.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: ListItem(
                        title: e.name,
                        description: 'Séries: ${e.sets}   Repetições: ${e.reps}   Peso: ${e.weight ?? '-'}',
                        onTap: () {
                          Routefly.push(routePaths.customers.workout.exercise.$item.changes({
                            'item': jsonEncoder.convert(e),
                          }));
                        },
                      ),
                    ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Routefly.push(routePaths.customers.workout.exercise.newExercise);
          },
          child: const Icon(Icons.add),
        ));
  }
}
