part of characters;

const CharactersDI charactersDI = CharactersDI();

class CharactersDI extends DI {
  const CharactersDI();

  @override
  void setup() {
    sl.registerSingletonWithDependencies<GraphQLService>(
      () => GraphQLServiceImpl(
        graphQLClient: sl.get<GraphQLClient>(),
        query: sl.get<GqlQuery>(),
      ),
      dependsOn: <Type>[GraphQLClient, GqlQuery],
    );

    sl.registerSingletonWithDependencies<domain.CharactersRepository>(
      () => CharactersRepositoryImpl(
        graphQLService: sl.get<GraphQLService>(),
      ),
      dependsOn: <Type>[
        GraphQLService,
      ],
    );

    sl.registerFactory<domain.GetCharactersUseCase>(
      () => domain.GetCharactersUseCase(
        repository: sl.get<domain.CharactersRepository>(),
      ),
    );
  }
}
