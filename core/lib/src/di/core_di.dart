part of core;

const CoreDI coreDI = CoreDI();

class CoreDI extends DI {
  const CoreDI();

  @override
  void setup() {
    sl.registerLazySingleton<GraphQLConfig>(
      () => GraphQLConfig(),
    );

    sl.registerLazySingleton<GqlQuery>(
      () => GqlQuery(),
    );
  }
}
