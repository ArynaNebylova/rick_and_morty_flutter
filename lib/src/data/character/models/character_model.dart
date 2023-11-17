part of character;

class CharacterModel extends domain.CharacterEntity {
  const CharacterModel({
    required final String name,
    required final String image,
    required final String species,
    required final String gender,
    required final String status,
  }) : super(
            name: name,
            image: image,
            species: species,
            gender: gender,
            status: status);

  factory CharacterModel.fromMap({required Map map}) => CharacterModel(
        name: map['name'],
        image: map['image'],
        species: map['species'],
        gender: map['gender'],
        status: map['status'],
      );
}
