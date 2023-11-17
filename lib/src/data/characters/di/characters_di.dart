part of characters;

class CharactersDI extends DI {
  const CharactersDI();

  @override
  List<SingleChildWidget> setup() {
    final graphQLService = Provider<GraphQLService>(
      create: (ref) => GraphQLServiceImpl(
        gqlClient: Provider.of<GqlClient>(ref, listen: false),
        query: Provider.of<GqlQuery>(ref, listen: false),
      ),
    );

    final charactersRepository = Provider<domain.CharactersRepository>(
      create: (ref) => CharactersRepositoryImpl(
        graphQLService: Provider.of<GraphQLService>(ref, listen: false),
      ),
    );

    final getCharactersUseCase = Provider<domain.GetCharactersUseCase>(
      create: (
        ref,
      ) =>
          domain.GetCharactersUseCase(
        repository:
            Provider.of<domain.CharactersRepository>(ref, listen: false),
      ),
    );

    return [graphQLService, charactersRepository, getCharactersUseCase];
  }
}
