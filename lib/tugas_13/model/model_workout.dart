// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Workout {
  int? id;
  String title;
  int duration;
  String status;

  Workout({
    this.id,
    required this.title,
    required this.duration,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'duration': duration,
      'status': status,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      duration: map['duration'] as int,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Workout.fromJson(String source) =>
      Workout.fromMap(json.decode(source) as Map<String, dynamic>);
}
