part of "favorite_cubit.dart";

enum FavoriteStatus { initial, loading, success }

class FavoriteState extends Equatable {
  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.favorites = const [],
  });

  final FavoriteStatus status;
  final List<FavoriteModel> favorites;

  @override
  List<Object?> get props => [status, favorites];

  FavoriteState copyWith({
    FavoriteStatus? status,
    List<FavoriteModel>? favorites,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
    );
  }
}
