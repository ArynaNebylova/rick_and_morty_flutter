part of characters;

abstract class CharactersRepository {
  Future<CharactersEntity> getCharactersPerPage(int page);
}
