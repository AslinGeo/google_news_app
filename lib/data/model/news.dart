class News {
  String title;
  String description;
  String source;
  DateTime publishedDate;

  News({
    required this.title,
    required this.description,
    required this.source,
    required this.publishedDate,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      source: json['source'],
      publishedDate: DateTime.parse(json['publishedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'source': source,
      'publishedDate': publishedDate.toIso8601String(),
    };
  }
}
