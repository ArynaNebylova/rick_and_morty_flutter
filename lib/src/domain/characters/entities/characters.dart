part of '../characters.dart';

class CharactersEntity {
  final List<SingleCharacterEntity> characters;
  final int? nextPage;

  const CharactersEntity({
    required this.characters,
    required this.nextPage,
  });
}
