class FavoriteEntity {
  int? id;
  String name;
  String image;

  FavoriteEntity({this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return {'name': name, 'image': image};
  }
}
