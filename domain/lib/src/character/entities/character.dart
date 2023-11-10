part of character;

class CharacterEntity extends Equatable {
  final String name;
  final String image;
  final String species;
  final String gender;
  final String status;

  const CharacterEntity({
    required this.name,
    required this.image,
    required this.species,
    required this.gender,
    required this.status,
  });

  @override
  List<Object?> get props => [
        name,
        image,
        species,
        gender,
        status,
      ];
}
