part of core;

const CoreDI coreDI = CoreDI();

class CoreDI extends DI {
  const CoreDI();

  @override
  void setup() {
    sl.registerLazySingleton<GraphQLClient>(
      () => GraphQLConfig.client(),
    );
    //  getIt.registerSingleton<AppConfig>(
    //   AppConfig.fromFlavor(flavor: flavor),
    // );
    //  getIt.registerSingleton<AppConfig>(
    //   AppConfig.fromFlavor(flavor: flavor),
    // );
  }
}
