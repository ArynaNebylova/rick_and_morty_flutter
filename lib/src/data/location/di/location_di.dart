part of location;

const LocationDI locationDI = LocationDI();

class LocationDI extends DI {
  const LocationDI();

  @override
  List<SingleChildWidget> setup() {
    final graphQLService = Provider<GraphQLService>(
      create: (ref) => GraphQLServiceImpl(
        gqlClient: Provider.of<GqlClient>(ref, listen: false),
        query: Provider.of<GqlQuery>(ref, listen: false),
      ),
    );

    final locationRepository = Provider<domain.LocationRepository>(
      create: (ref) => LocationRepositoryImpl(
        graphQLService: Provider.of<GraphQLService>(ref, listen: false),
      ),
    );

    final getLocationUseCase = Provider<domain.GetLocationUseCase>(
      create: (
        ref,
      ) =>
          domain.GetLocationUseCase(
        repository: Provider.of<domain.LocationRepository>(ref, listen: false),
      ),
    );

    return [graphQLService, locationRepository, getLocationUseCase];
  }
}
