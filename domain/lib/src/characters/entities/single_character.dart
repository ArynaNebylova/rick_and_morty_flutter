part of characters;

class SingleCharacterEntity extends Equatable {
  final String name;
  final String id;

  const SingleCharacterEntity({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        id,
      ];
}
