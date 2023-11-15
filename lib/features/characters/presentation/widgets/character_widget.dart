import 'package:rick_and_morty/features/character/presentation/pages/character_screen.dart';
import 'package:rick_and_morty/features/characters/domain/domain.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final SingleCharacterEntity character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CharacterScreen(id: character.id);
          }),
        );
      },
      child: ListTile(
        title: Text(character.name),
      ),
    );
  }
}
