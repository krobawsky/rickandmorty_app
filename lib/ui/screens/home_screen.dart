import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty_app/domain/models/models.dart';
import 'package:rickandmorty_app/ui/cubits/character/character_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  late CharacterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CharacterCubit>();
    cubit.getCharacters();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        cubit.getCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Rick And Morty",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true),
        body: BlocBuilder<CharacterCubit, CharacterState>(
            buildWhen: (p, c) =>
                (p.status != c.status || p.characters != c.characters),
            builder: (context, state) => _homeBody(context, state)));
  }

  Widget _homeBody(BuildContext context, CharacterState state) {
    switch (state.status) {
      case CharacterStatus.error:
        return _bodyText("Ha ocurrido un error");
      case CharacterStatus.initial:
        return _bodyText("No se ha realizado una búsqueda");
      case CharacterStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case CharacterStatus.success:
        return state.characters.isEmpty
            ? _bodyText('No se encontraron resultados')
            : CharacterList(
                characters: state.characters,
                scrollController: scrollController);
    }
  }

  Widget _bodyText(String text) => Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      );
}

class CharacterList extends StatelessWidget {
  const CharacterList(
      {super.key, required this.characters, required this.scrollController});

  final List<CharacterModel> characters;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.87,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: characters.length,
        controller: scrollController,
        itemBuilder: (context, index) {
          final character = characters[index];
          return GestureDetector(
            onTap: () {
              context.go("/character");
            },
            child: Card(
                child: Column(
              children: [
                FadeInImage(
                    placeholder: const AssetImage("assets/images/portal.gif"),
                    image: NetworkImage(character.image!)),
                Text(character.name ?? "No Name",
                    style: const TextStyle(
                        fontSize: 16, overflow: TextOverflow.ellipsis))
              ],
            )),
          );
        });
  }
}
