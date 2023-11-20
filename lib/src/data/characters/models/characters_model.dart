part of '../characters.dart';

class CharactersModel extends domain.CharactersEntity {
  const CharactersModel({
    required List<SingleCharacterModel> super.characters,
    required super.nextPage,
  });

  factory CharactersModel.fromMap({required Map<String, dynamic> map}) =>
      CharactersModel(
        characters: parseCharacters(
          map['results']! as List<Object?>,
        ),
        nextPage: (map['info'] as Map<String, dynamic>)['next'] as int,
      );

  static List<SingleCharacterModel> parseCharacters(
    List<Object?> characters,
  ) {
    return List.generate(
      characters.length,
      (index) => SingleCharacterModel.fromMap(
        map: characters[index]! as Map<String, dynamic>,
      ),
    );
  }
}
