import 'package:flutter/material.dart';
import 'package:rickandmorty_app/domain/models/models.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.40,
              width: double.infinity,
              child: Hero(
                  tag: character.id,
                  child: Image.network(character.image, fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: size.height * 0.12,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardData("Status", character.status),
                  cardData("Specie", character.species),
                  cardData("Origen", character.origin?.name)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardData(String description, String? value) {
    return Expanded(
        child: Card(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(description),
        Text(
          value ?? "Undefined",
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        )
      ],
    )));
  }
}
