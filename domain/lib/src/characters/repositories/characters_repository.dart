part of characters;

abstract class CharactersRepository {
  Future<List<CharactersEntity>> getCharactersPerPage(int page);
}
