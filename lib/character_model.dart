class CharacterModel {
  final String name;
  final String image;
  final String species;
  final String gender;
  final String status;

  const CharacterModel({
    required this.name,
    required this.image,
    required this.species,
    required this.gender,
    required this.status,
  });
  static CharacterModel fromMap({required Map map}) => CharacterModel(
      gender: map['gender'],
      name: map['name'],
      image: map['image'],
      species: map['species'],
      status: map['status']);
}
