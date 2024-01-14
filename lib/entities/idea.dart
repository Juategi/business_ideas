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
  webs,
  ecommerce,
  food,
  health,
  education,
  music,
  art,
  sports,
  videogames,
  ai,
  vr,
  professional,
  turism,
  fashion,
  finances,
  environment,
  mobility,
  realState
}
