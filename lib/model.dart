class Posts {
  int id;
  String title;
  String body;
  String picture;

  Posts({
    required this.id,
    required this.title,
    required this.body,
    required this.picture
    });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['original_title'],
      body: json['overview'],
      picture: json['poster_path'],
      );
  }
}
