part of character;

class GetCharacterUseCase {
  final CharacterRepository repository;

  GetCharacterUseCase({required this.repository});

  Future<CharacterEntity> call(String id) {
    return repository.getCharacter(id);
  }
}
