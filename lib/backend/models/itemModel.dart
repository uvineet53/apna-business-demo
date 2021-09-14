class ItemModel {
  ItemModel({
    required this.id,
    required this.createdAt,
    required this.createdAtI,
    required this.type,
    required this.author,
    required this.title,
    required this.url,
    required this.text,
    required this.points,
    required this.parentId,
    required this.storyId,
    required this.children,
  });

  int id;
  DateTime createdAt;
  int createdAtI;
  String type;
  String author;
  String title;
  String url;
  String text;
  int? points;
  int? parentId;
  int? storyId;
  List<ItemModel>? children;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        createdAtI: json["created_at_i"],
        type: json["type"],
        author: json["author"],
        title: json["title"] == null ? "" : json["title"],
        url: json["url"] == null ? "" : json["url"],
        text: json["text"] == null ? "" : json["text"],
        points: json["points"] == null ? 0 : json["points"],
        parentId: json["parent_id"] == null ? 0 : json["parent_id"],
        storyId: json["story_id"] == null ? 0 : json["story_id"],
        children: json["children"] == null
            ? List<ItemModel>.from(
                json["children"].map((x) => ItemModel.fromJson(x)))
            : [],
      );
}
