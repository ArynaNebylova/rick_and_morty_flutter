part of characters;

class GetCharactersUseCase {
  final CharactersRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<List<CharactersEntity>> call(int page) {
    return repository.getCharactersPerPage(page);
  }
}
