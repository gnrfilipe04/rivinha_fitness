class Exercise {
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
  final int? sets;
  final int? reps;
  final String? speed;
  final String? weight;
  final String? startDate;
  final String? endDate;
  final String id;

  Exercise(
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
      this.endDate,
      required this.id});
}
