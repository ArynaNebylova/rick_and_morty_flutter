part of '../location.dart';

class LocationRepositoryImpl implements domain.LocationRepository {
  final GraphQLService _graphQLService;

  LocationRepositoryImpl({
    required GraphQLService graphQLService,
  }) : _graphQLService = graphQLService;

  @override
  Future<domain.LocationEntity> getLocation(String id) async {
    final Map<String, dynamic> location = await _graphQLService.getLocation(id);

    return LocationModel.fromMap(map: location);
  }
}
