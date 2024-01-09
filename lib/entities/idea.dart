class Idea {
  String title;
  String id;
  String smallDescription;
  String description;
  List<String> steps;
  Category category;

  Idea({
    required this.id,
    required this.title,
    required this.smallDescription,
    required this.description,
    required this.steps,
    required this.category,
  });

  factory Idea.fromJson(
      Map<String, dynamic> json, String langCode, Category category) {
    return Idea(
      id: json['id'],
      title: json['title'],
      smallDescription: json['smallDescription'][langCode],
      description: json['description'][langCode],
      steps: json['steps'][langCode].cast<String>(),
      category: category,
    );
  }
}

enum Category {
  tech,
  ecommerce,
  food,
  health,
  education,
  entertainment,
  professional,
  turism,
  environment,
  fashion,
  finances,
  mobility,
  realState,
}
