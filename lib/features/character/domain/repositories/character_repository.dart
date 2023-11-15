part of domain;

abstract class CharacterRepository {
  Future<CharacterEntity> getCharacter(String id);
}
