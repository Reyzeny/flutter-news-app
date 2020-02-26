class Sources {
  final String id;
  final String name;

  Sources.fromJson(json)
      : id = json["id"],
        name = json["name"];
}
