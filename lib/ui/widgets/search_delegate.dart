import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty_app/domain/models/models.dart';

import '../cubits/character/character_cubit.dart';

class SearchCharacter extends SearchDelegate {
  final CharacterCubit cubit;
  SearchCharacter(this.cubit);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Widget circleLoading() {
      return const Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/portal.gif"),
        ),
      );
    }

    if (query.isEmpty) {
      return circleLoading();
    }

    return FutureBuilder(
        future: cubit.searhCharacter(search: query),
        builder: (context, AsyncSnapshot<List<CharacterModel>> snapshot) {
          if (!snapshot.hasData) {
            return circleLoading();
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final character = snapshot.data![index];
                return ListTile(
                  onTap: () {
                    context.go("/character", extra: character);
                  },
                  title: Text(character.name),
                  leading: Hero(
                      tag: character.id,
                      child:
                          CircleAvatar(child: Image.network(character.image))),
                );
              });
        });
  }
}
