part of domain;

abstract class LocationRepository {
  Future<LocationEntity> getLocation(String id);
}
