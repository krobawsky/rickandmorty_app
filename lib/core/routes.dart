import 'package:go_router/go_router.dart';
import 'package:rickandmorty_app/domain/models/models.dart';
import 'package:rickandmorty_app/ui/screens/home_screen.dart';
import 'package:rickandmorty_app/ui/screens/character_screen.dart';
import 'package:rickandmorty_app/ui/screens/favorite_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
            path: 'character',
            builder: (context, state) {
              final character = state.extra as CharacterModel;
              return CharacterScreen(character: character);
            }),
        GoRoute(
            path: 'favorites',
            builder: (context, state) {
              return const FavoriteScreen();
            })
      ]),
]);
