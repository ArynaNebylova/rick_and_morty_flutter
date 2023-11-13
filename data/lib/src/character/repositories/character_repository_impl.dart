part of character;

class CharacterRepositoryImpl implements domain.CharacterRepository {
  final GraphQLService _graphQLService;

  CharacterRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<domain.CharacterEntity> getCharacter(String id) async {
    final Map? character = await _graphQLService.getCharacter(id);

    return CharacterModel.fromMap(map: character!);
  }
}
