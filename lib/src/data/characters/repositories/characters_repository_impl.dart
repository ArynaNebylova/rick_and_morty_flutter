part of '../characters.dart';

class CharactersRepositoryImpl implements domain.CharactersRepository {
  final GraphQLService _graphQLService;

  CharactersRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<domain.CharactersEntity> getCharactersPerPage(int page) async {
    final characters =
        await _graphQLService.getCharacters(page) as Map<String, dynamic>;

    return CharactersModel.fromMap(map: characters);
  }
}
