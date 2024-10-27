import 'package:fpdart/fpdart.dart';
import 'package:rickandmorty_app/data/exceptions/exceptions.dart';
import 'package:rickandmorty_app/data/entities/response/response.dart';

abstract class CharacterImplement {
  Future<Either<DataException, CharacterListEntityResponse>> getCharacters(
      {int page, String search});
}
