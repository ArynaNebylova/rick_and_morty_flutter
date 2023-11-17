import 'package:rick_and_morty/src/domain/character/character.dart';
import 'package:flutter/material.dart';

class CharacterContent extends StatelessWidget {
  final CharacterEntity character;

  const CharacterContent({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(character.name),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(character.image),
                ),
                Text('name: ${character.name}'),
                Text('species: ${character.species}'),
                Text('gender: ${character.gender}'),
                Text('status: ${character.status}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
