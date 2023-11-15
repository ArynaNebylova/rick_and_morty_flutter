part of domain;

abstract class CharactersRepository {
  Future<CharactersEntity> getCharactersPerPage(int page);
}
