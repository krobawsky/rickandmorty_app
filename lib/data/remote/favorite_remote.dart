import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:rickandmorty_app/data/implements/implements.dart';
import 'package:rickandmorty_app/data/entities/local/local.dart';

class FavoriteRemote implements FavoriteImplement {
  FavoriteRemote();

  static Future<Database> _openDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'rickandmorty.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE favorites (id INTEGER PRIMARY KEY, name TEXT, image TEXT)",
      );
    });
  }

  @override
  Future<List<FavoriteEntity>> getFavorites() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> favoritesMap =
        await database.query("favorites");

    return List.generate(
        favoritesMap.length,
        (i) => FavoriteEntity(
            id: favoritesMap[i]['id'],
            name: favoritesMap[i]['name'],
            image: favoritesMap[i]['image']));
  }

  @override
  Future<int> addFavorite(FavoriteEntity favorite) async {
    Database database = await _openDB();
    return database.insert("favorites", favorite.toMap());
  }

  @override
  Future<int> deleteFavorite(int id) async {
    Database database = await _openDB();
    return database.delete("favorites", where: "id = ?", whereArgs: [id]);
  }
}
