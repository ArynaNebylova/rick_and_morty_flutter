part of domain;

abstract class LocationsRepository {
  Future<LocationsEntity> getLocationsPerPage(int page);
}
