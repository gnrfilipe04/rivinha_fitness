// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_exercise_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewExerciseStore on _NewExerciseStoreBase, Store {
  late final _$imageAtom =
      Atom(name: '_NewExerciseStoreBase.image', context: context);

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  bool _imageIsInitialized = false;

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, _imageIsInitialized ? super.image : null,
        () {
      super.image = value;
      _imageIsInitialized = true;
    });
  }

  late final _$getImageAsyncAction =
      AsyncAction('_NewExerciseStoreBase.getImage', context: context);

  @override
  Future getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  late final _$_NewExerciseStoreBaseActionController =
      ActionController(name: '_NewExerciseStoreBase', context: context);

  @override
  dynamic createNewExercise({required ExerciseModel exercise}) {
    final _$actionInfo = _$_NewExerciseStoreBaseActionController.startAction(
        name: '_NewExerciseStoreBase.createNewExercise');
    try {
      return super.createNewExercise(exercise: exercise);
    } finally {
      _$_NewExerciseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image}
    ''';
  }
}
