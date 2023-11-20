part of '../locations.dart';

class LocationsRepositoryImpl implements domain.LocationsRepository {
  final GraphQLService _graphQLService;

  LocationsRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<domain.LocationsEntity> getLocationsPerPage(int page) async {
    final locations =
        await _graphQLService.getLocations(page) as Map<String, dynamic>;

    return LocationsModel.fromMap(map: locations);
  }
}
