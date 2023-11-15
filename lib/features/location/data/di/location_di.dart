part of data;

const LocationDI locationDI = LocationDI();

class LocationDI extends DI {
  const LocationDI();

  @override
  void setup() {
    sl.registerLazySingleton<GraphQLService>(
      () => GraphQLServiceImpl(
        gqlClient: sl.call(),
        query: sl.call(),
      ),
    );

    sl.registerLazySingleton<domain.LocationRepository>(
      () => LocationRepositoryImpl(
        graphQLService: sl.call(),
      ),
    );

    sl.registerFactory<domain.GetLocationUseCase>(
      () => domain.GetLocationUseCase(
        repository: sl.get<domain.LocationRepository>(),
      ),
    );
  }
}
