part of '../characters.dart';

class CharactersModel extends domain.CharactersEntity {
  const CharactersModel({
    required List<SingleCharacterModel> super.characters,
    required super.nextPage,
  });

  factory CharactersModel.fromMap({required Map<String, dynamic> map}) =>
      CharactersModel(
        characters: parseCharacters(
          map['results']! as List<Map<String, dynamic>>,
        ),
        nextPage: Map<String, int>.from(map['info']! as Map)['next'],
      );

  static List<SingleCharacterModel> parseCharacters(
    List<Map<String, dynamic>> characters,
  ) {
    return List.generate(
      characters.length,
      (index) => SingleCharacterModel.fromMap(
        map: characters[index],
      ),
    );
  }
}
