part of characters;

const CharactersDI charactersDI = CharactersDI();

class CharactersDI extends DI {
  const CharactersDI();

  @override
  void setup() {
    sl.registerLazySingleton<GraphQLService>(
      () => GraphQLServiceImpl(
        gqlConfig: sl.call(),
        query: sl.call(),
      ),
    );

    sl.registerLazySingleton<domain.CharactersRepository>(
      () => CharactersRepositoryImpl(
        graphQLService: sl.call(),
      ),
    );

    sl.registerFactory<domain.GetCharactersUseCase>(
      () => domain.GetCharactersUseCase(
        repository: sl.get<domain.CharactersRepository>(),
      ),
    );
  }
}
