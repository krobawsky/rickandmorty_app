import 'package:rickandmorty_app/data/entities/local/local.dart';

class FavoriteModel {
  int id;
  String name;
  String image;

  FavoriteModel({
    this.id = 0,
    this.name = "",
    this.image = "",
  });

  factory FavoriteModel.fromEntity(FavoriteEntity entity) =>
      FavoriteModel(id: entity.id ?? 0, name: entity.name, image: entity.image);
}
