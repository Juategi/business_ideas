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

  factory Idea.fromJson(Map<String, dynamic> json, String langCode) {
    return Idea(
      id: json['id'],
      title: json['title'],
      description: json['description'][langCode],
      steps: json['steps'][langCode].cast<String>(),
    );
  }
}
