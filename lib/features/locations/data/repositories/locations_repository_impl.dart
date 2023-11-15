part of data;

class LocationsRepositoryImpl implements domain.LocationsRepository {
  final GraphQLService _graphQLService;

  LocationsRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<domain.LocationsEntity> getLocationsPerPage(int page) async {
    final locations = await _graphQLService.getLocations(page);

    if (locations == null || locations.isEmpty) {
      return const domain.LocationsEntity(locations: [], nextPage: null);
    }

    return LocationsModel.fromMap(map: locations);
  }
}
