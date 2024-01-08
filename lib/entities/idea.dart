import 'dart:io';

class Idea {
  String title;
  String id;
  String description;
  List<String> steps;

  Idea({
    required this.id,
    required this.title,
    required this.description,
    required this.steps,
  });

  factory Idea.fromJson(Map<String, dynamic> json) {
    String locale = Platform.localeName;
    locale = "es";
    return Idea(
      id: json['id'],
      title: json['title'],
      description: json['description'][locale],
      steps: json['steps'][locale].cast<String>(),
    );
  }
}
