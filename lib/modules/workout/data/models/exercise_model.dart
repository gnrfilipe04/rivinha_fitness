import 'package:rivinha_fitness/modules/workout/domain/entities/exercise.dart';
import 'package:uuid/uuid.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required String name,
    String? description,
    String? image,
    String? video,
    String? level,
    String? time,
    String? type,
    String? equipment,
    String? muscle,
    String? calories,
    String? steps,
    String? rest,
    int? sets,
    int? reps,
    String? speed,
    String? weight,
    String? startDate,
    String? endDate,
    required String id,
  }) : super(
          name: name,
          description: description,
          image: image,
          video: video,
          level: level,
          time: time,
          type: type,
          equipment: equipment,
          muscle: muscle,
          calories: calories,
          steps: steps,
          rest: rest,
          sets: sets,
          reps: reps,
          speed: speed,
          weight: weight,
          startDate: startDate,
          endDate: endDate,
          id: id,
        );

  factory ExerciseModel.empty() {
    return ExerciseModel(
        name: '',
        description: '',
        image: '',
        video: '',
        level: '',
        time: '',
        type: '',
        equipment: '',
        muscle: '',
        calories: '',
        steps: '',
        rest: '',
        sets: 0,
        reps: 0,
        speed: '',
        weight: '',
        startDate: '',
        endDate: '',
        id: const Uuid().v4());
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        video: json['video'],
        level: json['level'],
        time: json['time'],
        type: json['type'],
        equipment: json['equipment'],
        muscle: json['muscle'],
        calories: json['calories'],
        steps: json['steps'],
        rest: json['rest'],
        sets: json['sets'],
        reps: json['reps'],
        speed: json['speed'],
        weight: json['weight'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'image': image,
        'video': video,
        'level': level,
        'time': time,
        'type': type,
        'equipment': equipment,
        'muscle': muscle,
        'calories': calories,
        'steps': steps,
        'rest': rest,
        'sets': sets,
        'reps': reps,
        'speed': speed,
        'weight': weight,
        'startDate': startDate,
        'endDate': endDate,
        'id': id
      };
}
