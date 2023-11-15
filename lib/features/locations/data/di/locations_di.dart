part of data;

const LocationsDI locationsDI = LocationsDI();

class LocationsDI extends DI {
  const LocationsDI();

  @override
  void setup() {
    sl.registerLazySingleton<GraphQLService>(
      () => GraphQLServiceImpl(
        gqlClient: sl.call(),
        query: sl.call(),
      ),
    );

    sl.registerLazySingleton<domain.LocationsRepository>(
      () => LocationsRepositoryImpl(
        graphQLService: sl.call(),
      ),
    );

    sl.registerFactory<domain.GetLocationsUseCase>(
      () => domain.GetLocationsUseCase(
        repository: sl.get<domain.LocationsRepository>(),
      ),
    );
  }
}
