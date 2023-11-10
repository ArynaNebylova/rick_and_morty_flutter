part of characters;

class CharactersModel extends domain.CharactersEntity {
  const CharactersModel({
    required final String name,
    required final String id,
  }) : super(name: name, id: id);

  factory CharactersModel.fromMap({required Map<String, dynamic> map}) =>
      CharactersModel(
        name: map['name'],
        id: map['id'],
      );
}
