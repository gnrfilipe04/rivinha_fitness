class Workout {
  final String name;
  final String? description;
  final String? image;
  final String? video;
  final String? level;
  final String? time;
  final String? type;
  final String? equipment;
  final String? muscle;
  final String? calories;
  final String? steps;
  final String? rest;
  final String? sets;
  final String? reps;
  final String? speed;
  final String? weight;
  final String? startDate;
  final String? enDate;
  final String? id;

  Workout(
      {required this.name,
      this.description,
      this.image,
      this.video,
      this.level,
      this.time,
      this.type,
      this.equipment,
      this.muscle,
      this.calories,
      this.steps,
      this.rest,
      this.sets,
      this.reps,
      this.speed,
      this.weight,
      this.startDate,
      this.enDate,
      this.id});

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
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
        enDate: json['enDate'],
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
        'enDate': enDate,
        'id': id
      };
}
