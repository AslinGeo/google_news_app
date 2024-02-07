class News {
  String title;
  String description;
  String source;
  DateTime publishedDate;
  String url;
  News(
      {required this.title,
      required this.description,
      required this.source,
      required this.publishedDate,
      required this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        description: json['description'],
        source: json['source'],
        publishedDate: DateTime.parse(json['publishedDate']),
        url: json["url"]);
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
