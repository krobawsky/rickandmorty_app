part of "character_cubit.dart";

enum CharacterStatus { initial, loading, success, error }

class CharacterState extends Equatable {
  const CharacterState({
    this.status = CharacterStatus.initial,
    this.error = '',
    this.page = 1,
    this.count = 1,
    this.characters = const [],
  });

  final CharacterStatus status;
  final String error;
  final int page, count;
  final List<CharacterModel> characters;

  @override
  List<Object?> get props => [status, error, page, count, characters];

  CharacterState copyWith({
    CharacterStatus? status,
    String? error,
    int? page,
    int? count,
    List<CharacterModel>? characters,
  }) {
    return CharacterState(
      status: status ?? this.status,
      error: error ?? this.error,
      page: page ?? this.page,
      count: count ?? this.count,
      characters: characters ?? this.characters,
    );
  }
}
