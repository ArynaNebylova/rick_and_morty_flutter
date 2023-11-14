part of characters;

class CharactersEntity extends Equatable {
  final List<SingleCharacterEntity> characters;
  final int? nextPage;

  const CharactersEntity({
    required this.characters,
    required this.nextPage,
  });

  @override
  List<Object?> get props => [characters, nextPage];
}
