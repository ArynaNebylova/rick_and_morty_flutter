part of character;

abstract class CharacterRepository {
  Future<CharacterEntity> getCharacter(String id);
}
