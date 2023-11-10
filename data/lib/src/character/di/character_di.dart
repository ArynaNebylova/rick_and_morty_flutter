part of character;

const CharacterDI characterDI = CharacterDI();

class CharacterDI extends DI {
  const CharacterDI();

  @override
  void setup() {
    sl.registerLazySingleton<GraphQLService>(
      () => GraphQLServiceImpl(
        gqlConfig: sl.call(),
        query: sl.call(),
      ),
    );

    sl.registerLazySingleton<domain.CharacterRepository>(
      () => CharacterRepositoryImpl(
        graphQLService: sl.call(),
      ),
    );

    sl.registerFactory<domain.GetCharacterUseCase>(
      () => domain.GetCharacterUseCase(
        repository: sl.get<domain.CharacterRepository>(),
      ),
    );
  }
}
