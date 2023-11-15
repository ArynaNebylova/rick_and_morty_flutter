part of domain;

class GetCharactersUseCase {
  final CharactersRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<CharactersEntity> call(int page) {
    return repository.getCharactersPerPage(page);
  }
}
