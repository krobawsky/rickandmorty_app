import 'package:rickandmorty_app/data/entities/local/local.dart';
import 'package:rickandmorty_app/data/remote/remote.dart';
import 'package:rickandmorty_app/domain/models/models.dart';

class FavoriteRepository {
  final _favoriteRemote = FavoriteRemote();

  Future<List<FavoriteModel>> getFavorites() async {
    final response = await _favoriteRemote.getFavorites();
    return response.map((e) => FavoriteModel.fromEntity(e)).toList();
  }

  Future<int> addFavorite(String name, String image) async {
    FavoriteEntity newFavorite = FavoriteEntity(name: name, image: image);
    return await _favoriteRemote.addFavorite(newFavorite);
  }

  Future<int> deleteFavorite(int id) async {
    return await _favoriteRemote.deleteFavorite(id);
  }
}
