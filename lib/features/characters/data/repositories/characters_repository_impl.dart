part of data;

class CharactersRepositoryImpl implements domain.CharactersRepository {
  final GraphQLService _graphQLService;

  CharactersRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<domain.CharactersEntity> getCharactersPerPage(int page) async {
    final characters = await _graphQLService.getCharacters(page);

    if (characters == null || characters.isEmpty) {
      return const domain.CharactersEntity(characters: [], nextPage: null);
    }

    return CharactersModel.fromMap(map: characters);
  }
}
