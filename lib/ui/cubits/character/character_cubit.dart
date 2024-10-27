import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/domain/models/models.dart';
import 'package:rickandmorty_app/domain/repositories/repositories.dart';

part "character_state.dart";

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(
    this._characterRepository,
  ) : super(const CharacterState());

  final CharacterRepository _characterRepository;

  void clean() => emit(state.copyWith(
      status: CharacterStatus.initial,
      error: '',
      page: 1,
      count: 0,
      characters: []));

  void getCountries({String search = ''}) async {
    if (state.status == CharacterStatus.loading ||
        (state.count == state.characters.length &&
            state.characters.isNotEmpty)) {
      return;
    }

    emit(state.copyWith(status: CharacterStatus.loading));
    final response = await _characterRepository.getCharacters(
        page: state.page, search: search);

    response.fold(
        (l) => emit(state.copyWith(error: '', status: CharacterStatus.error)),
        (r) {
      emit(state.copyWith(
          characters: r.results,
          page: state.page + 1,
          count: r.info?.count,
          status: CharacterStatus.success));
    });
  }
}