import 'package:rickandmorty_app/data/entities/local/local.dart';

abstract class FavoriteImplement {
  Future<List<FavoriteEntity>> getFavorites();
  Future<int> addFavorite(FavoriteEntity favorite);
  Future<int> deleteFavorite(int id);
}
