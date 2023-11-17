part of locations;

abstract class LocationsRepository {
  Future<LocationsEntity> getLocationsPerPage(int page);
}
