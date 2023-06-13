class Album {
  // Variables
  final int userId;
  final int id;
  final String title;

  // Constructor
  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  // fromJson
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userId: json["userId"], id: json["id"], title: json["title"]);
  }

  // toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userId"] = userId;
    data["id"] = id;
    data["title"] = title;
    return data;
  }
}

/*
  https://jsonplaceholder.typicode.com/albums/1

 {
  "userId": 1,
  "id": 1,
  "title": "quidem molestiae enim"
}

*/
