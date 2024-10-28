import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/domain/models/models.dart';
import 'package:rickandmorty_app/ui/cubits/favorite/favorite_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<FavoriteCubit>();
    cubit.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favoritos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
            buildWhen: (p, c) => (p.favorites != c.favorites),
            builder: (context, state) => _homeBody(context, state)));
  }

  Widget _homeBody(BuildContext context, FavoriteState state) {
    return state.favorites.isEmpty
        ? _bodyText('No se encontraron resultados')
        : FavoriteList(favorites: state.favorites, cubit: cubit);
  }

  Widget _bodyText(String text) => Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      );
}

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key, required this.favorites, required this.cubit});

  final List<FavoriteModel> favorites;
  final FavoriteCubit cubit;
  // Notice the variable type
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final character = favorites[index];
          return Dismissible(
              key: Key(character.id.toString()),
              onDismissed: (direction) {
                cubit.deleteFavorite(character.id);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${character.name} deleted from favorites')));
              },
              child: ListTile(
                  title: Text(character.name),
                  leading:
                      CircleAvatar(child: Image.network(character.image))));
        });
  }
}
