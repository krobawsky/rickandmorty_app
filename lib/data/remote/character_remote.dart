import 'package:fpdart/fpdart.dart';
import 'package:rickandmorty_app/data/entities/response/response.dart';
import 'package:rickandmorty_app/data/exceptions/exceptions.dart';
import 'package:rickandmorty_app/data/implements/implements.dart';

import 'package:http/http.dart' as http;

class CharacterRemote implements CharacterImplement {
  CharacterRemote();

  final url = "https://rickandmortyapi.com/api";

  @override
  Future<Either<DataException, CharacterListEntityResponse>> getCharacters(
      {int page = 1, String search = ""}) async {
    try {
      String route = "$url/character?page=$page&search=$search";
      final response = await http.get(Uri.parse(route));
      return Right(characterEntityResponseFromJson(response.body));
    } catch (e) {
      return Left(DataException(error: e.toString()));
    }
  }
}
