part of '../character.dart';

class CharacterDI extends DI {
  const CharacterDI();

  @override
  List<SingleChildWidget> setup() {
    final graphQLService = Provider<GraphQLService>(
      create: (ref) => GraphQLServiceImpl(
        gqlClient: Provider.of<GqlClient>(ref, listen: false),
        query: Provider.of<GqlQuery>(ref, listen: false),
      ),
    );

    final characterRepository = Provider<domain.CharacterRepository>(
      create: (ref) => CharacterRepositoryImpl(
        graphQLService: Provider.of<GraphQLService>(ref, listen: false),
      ),
    );

    final getCharacterUseCase = Provider<domain.GetCharacterUseCase>(
      create: (
        ref,
      ) =>
          domain.GetCharacterUseCase(
        repository: Provider.of<domain.CharacterRepository>(ref, listen: false),
      ),
    );

    return [graphQLService, characterRepository, getCharacterUseCase];
  }
}
