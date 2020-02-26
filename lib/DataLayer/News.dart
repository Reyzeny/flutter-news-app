class News {
  final String author;
  final String content;

  News.fromJson(json)
      : author = json["author"],
        content = json["content"];
}
