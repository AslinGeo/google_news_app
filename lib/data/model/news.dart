class News {
  String title;
  String? description;
  String? source;
  DateTime? publishedDate;
  String? url;
  News(
      {required this.title,
      this.description,
      this.source,
      this.publishedDate,
      this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        description: json['description'],
        source: json['source']["name"],
        publishedDate: DateTime.parse(json['publishedAt']),
        url: json["urlToImage"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'source': source,
      'publishedDate': publishedDate!.toIso8601String(),
    };
  }
}
