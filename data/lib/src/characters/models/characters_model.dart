part of characters;

class CharactersModel extends domain.CharactersEntity {
  const CharactersModel({
    required final List<SingleCharacterModel> characters,
    required final int? nextPage,
  }) : super(characters: characters, nextPage: nextPage);

  factory CharactersModel.fromMap({required Map<String, dynamic> map}) =>
      CharactersModel(
        characters: parseCharacters(map['results']),
        nextPage: map['info']['next'],
      );

  static List<SingleCharacterModel> parseCharacters(List<Object?> characters) {
    return List.generate(
      characters.length,
      (index) => SingleCharacterModel.fromMap(
        map: characters[index],
      ),
    );
  }
}
