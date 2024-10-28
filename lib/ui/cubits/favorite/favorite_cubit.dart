import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/domain/models/models.dart';
import 'package:rickandmorty_app/domain/repositories/repositories.dart';

part "favorite_state.dart";

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
    this._favoriteRepository,
  ) : super(const FavoriteState());

  final FavoriteRepository _favoriteRepository;

  void clean() => emit(state.copyWith(favorites: []));

  void getFavorites() async {
    final result = await _favoriteRepository.getFavorites();
    emit(state.copyWith(favorites: result));
  }

  Future<void> addFavorite(String name, String image) async {
    await _favoriteRepository.addFavorite(name, image);
  }

  Future<void> deleteFavorite(int id) async {
    await _favoriteRepository.deleteFavorite(id);
  }
}
