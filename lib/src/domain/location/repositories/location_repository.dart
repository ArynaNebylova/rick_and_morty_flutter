part of location;

abstract class LocationRepository {
  Future<LocationEntity> getLocation(String id);
}
