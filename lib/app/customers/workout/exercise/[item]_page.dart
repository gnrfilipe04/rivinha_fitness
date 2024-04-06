import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rivinha_fitness/model/Exercise.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';
import 'package:routefly/routefly.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final jsonDecoder = const JsonDecoder();
  final jsonEncoder = const JsonEncoder();
  late ExerciseModel? exercise;

  @override
  void initState() {
    exercise = Routefly.query['item'] != null
        ? ExerciseModel.fromJson(jsonDecoder.convert(Routefly.query['item']))
        : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(exercise?.name ?? 'Novo Exercício'),
          toolbarHeight: 100,
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () {
                print('Editar cliente');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              onPressed: () {
                print('Editar cliente');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.gray600,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  exercise?.image != null
                      ? Image(image: AssetImage(exercise!.image!))
                      : const Icon(Icons.image_not_supported, size: 300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.fitness_center_outlined,
                            color: MyColors.green500,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${exercise?.sets} Séries',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.repeat_outlined,
                            color: MyColors.green500,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${exercise?.reps} Repetições',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.balance,
                        color: MyColors.green500,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${exercise?.weight ?? '-'} Kg',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.green500,
                        minimumSize: const Size.fromHeight(60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Concluir Treino',
                        style: TextStyle(
                            color: MyColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
