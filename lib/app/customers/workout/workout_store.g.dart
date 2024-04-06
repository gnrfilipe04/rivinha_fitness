// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkoutStore on _WorkoutStoreBase, Store {
  late final _$workoutSelectedAtom =
      Atom(name: '_WorkoutStoreBase.workoutSelected', context: context);

  @override
  Workout? get workoutSelected {
    _$workoutSelectedAtom.reportRead();
    return super.workoutSelected;
  }

  @override
  set workoutSelected(Workout? value) {
    _$workoutSelectedAtom.reportWrite(value, super.workoutSelected, () {
      super.workoutSelected = value;
    });
  }

  late final _$_WorkoutStoreBaseActionController =
      ActionController(name: '_WorkoutStoreBase', context: context);

  @override
  void selectWorkout({required Workout workout}) {
    final _$actionInfo = _$_WorkoutStoreBaseActionController.startAction(
        name: '_WorkoutStoreBase.selectWorkout');
    try {
      return super.selectWorkout(workout: workout);
    } finally {
      _$_WorkoutStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addExerciseToWorkout({required ExerciseModel exercise}) {
    final _$actionInfo = _$_WorkoutStoreBaseActionController.startAction(
        name: '_WorkoutStoreBase.addExerciseToWorkout');
    try {
      return super.addExerciseToWorkout(exercise: exercise);
    } finally {
      _$_WorkoutStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
workoutSelected: ${workoutSelected}
    ''';
  }
}
