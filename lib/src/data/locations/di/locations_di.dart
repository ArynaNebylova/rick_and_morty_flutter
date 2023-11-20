part of '../locations.dart';

class LocationsDI extends DI {
  const LocationsDI();

  @override
  List<SingleChildWidget> setup() {
    final graphQLService = Provider<GraphQLService>(
      create: (ref) => GraphQLServiceImpl(
        gqlClient: Provider.of<GqlClient>(ref, listen: false),
        query: Provider.of<GqlQuery>(ref, listen: false),
      ),
    );

    final locationsRepository = Provider<domain.LocationsRepository>(
      create: (ref) => LocationsRepositoryImpl(
        graphQLService: Provider.of<GraphQLService>(ref, listen: false),
      ),
    );

    final getLocationsUseCase = Provider<domain.GetLocationsUseCase>(
      create: (
        ref,
      ) =>
          domain.GetLocationsUseCase(
        repository: Provider.of<domain.LocationsRepository>(ref, listen: false),
      ),
    );

    return [graphQLService, locationsRepository, getLocationsUseCase];
  }
}
