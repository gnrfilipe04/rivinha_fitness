import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/app/customers/workout/exercise/new_exercise_store.dart';
import 'package:rivinha_fitness/app/customers/workout/workout_store.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';

class NewExercise extends StatefulWidget {
  const NewExercise({super.key});

  @override
  State<NewExercise> createState() => _NewExerciseState();
}

class _NewExerciseState extends State<NewExercise> {
  NewExerciseStore store = NewExerciseStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Exercício'),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: store.nameController,
              decoration: const InputDecoration(labelText: 'Nome do Exercício'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: store.setsController,
                    decoration: const InputDecoration(labelText: 'Séries'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: store.repsController,
                    decoration: const InputDecoration(labelText: 'Repeticões'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: store.descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Observação'),
            ),
            const SizedBox(height: 10),
            Observer(builder: (_) {
              return GestureDetector(
                onTap: store.getImage,
                child: const Icon(Icons.add_a_photo_outlined,
                    color: MyColors.gray200, size: 40),
              );
            }),
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
                  'Salvar',
                  style: TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        )),
      )),
    );
  }
}
