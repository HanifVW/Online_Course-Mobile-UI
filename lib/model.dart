class Album {
  final int userId;
  final String id;
  final String name;

  const Album({
    required this.userId,
    required this.id,
    required this.name,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      name: json['name'],
    );
  }
}