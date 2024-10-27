import 'package:fpdart/fpdart.dart';
import 'package:rickandmorty_app/data/remote/remote.dart';
import 'package:rickandmorty_app/domain/exceptions/exceptions.dart';
import 'package:rickandmorty_app/domain/models/models.dart';

class CharacterRepository {
  final _characterRemote = CharacterRemote();

  Future<Either<DomainException, CharacterListModel>> getCharacters(
      {int page = 1, String search = ''}) async {
    final response =
        await _characterRemote.getCharacters(page: page, search: search);

    return response.fold(
        (dataExceptiond) => Left(DomainException(error: dataExceptiond.error)),
        (responseData) async {
      return Right(CharacterListModel.fromEntity(responseData));
    });
  }
}
