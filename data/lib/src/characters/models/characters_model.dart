part of characters;

class CharactersModel extends domain.CharactersEntity {
  const CharactersModel({
    required final String name,
    required final int id,
  }) : super(name: name, id: id);

  factory CharactersModel.fromMap({required Map map}) => CharactersModel(
        name: map['name'],
        id: map['id'],
      );
}
