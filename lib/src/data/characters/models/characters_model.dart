part of '../characters.dart';

class CharactersModel extends domain.CharactersEntity {
  const CharactersModel({
    required List<SingleCharacterModel> super.characters,
    required super.nextPage,
  });

  factory CharactersModel.fromMap({required Map<String, Object> map}) =>
      CharactersModel(
        characters: parseCharacters(
          map['results']! as List<Map<String, String>>,
        ),
        nextPage: map['info']['next'],
      );

  static List<SingleCharacterModel> parseCharacters(
    List<Map<String, String>> characters,
  ) {
    return List.generate(
      characters.length,
      (index) => SingleCharacterModel.fromMap(
        map: characters[index],
      ),
    );
  }
}
