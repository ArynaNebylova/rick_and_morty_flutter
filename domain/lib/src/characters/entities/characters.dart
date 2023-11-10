part of characters;

class CharactersEntity extends Equatable {
  final String name;
  final int id;

  const CharactersEntity({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        id,
      ];
}
