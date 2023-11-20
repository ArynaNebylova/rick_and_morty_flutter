part of '../locations.dart';

abstract class LocationsRepository {
  Future<LocationsEntity> getLocationsPerPage(int page);
}
