part of characters;

class SingleCharacterModel extends domain.SingleCharacterEntity {
  const SingleCharacterModel({
    required final String name,
    required final String id,
  }) : super(name: name, id: id);

  factory SingleCharacterModel.fromMap({required map}) => SingleCharacterModel(
        name: map['name'],
        id: map['id'],
      );
}
