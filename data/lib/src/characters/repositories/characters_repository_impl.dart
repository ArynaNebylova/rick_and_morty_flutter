part of characters;

class CharactersRepositoryImpl implements domain.CharactersRepository {
  final GraphQLService _graphQLService;

  CharactersRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<List<domain.CharactersEntity>> getCharactersPerPage(int page) async {
    final List? characters = await _graphQLService.getCharacters(page);

    if (characters == null || characters.isEmpty) {
      return [];
    }

    return characters.map((e) => CharactersModel.fromMap(map: e)).toList();
  }
}
