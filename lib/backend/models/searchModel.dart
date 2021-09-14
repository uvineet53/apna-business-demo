class SearchModel {
  SearchModel({
    required this.hits,
  });

  final List<Hit> hits;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );
}

class Hit {
  Hit({
    required this.createdAt,
    required this.title,
    required this.url,
    required this.author,
    required this.points,
    required this.createdAtI,
    // required this.relevancyScore,
    required this.objectId,
  });

  DateTime createdAt;
  String title;
  String url;
  String author;
  int points;
  int createdAtI;
  // int relevancyScore;
  String objectId;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        url: json["url"],
        author: json["author"],
        points: json["points"],
        createdAtI: json["created_at_i"],
        // relevancyScore: json["relevancy_score"],
        objectId: json["objectID"],
      );
}
