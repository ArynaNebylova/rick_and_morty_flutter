part of '../character.dart';

class CharacterRepositoryImpl implements domain.CharacterRepository {
  final GraphQLService _graphQLService;

  CharacterRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<domain.CharacterEntity> getCharacter(String id) async {
    final Map<String, dynamic> character =
        await _graphQLService.getCharacter(id);

    return CharacterModel.fromMap(map: character);
  }
}
