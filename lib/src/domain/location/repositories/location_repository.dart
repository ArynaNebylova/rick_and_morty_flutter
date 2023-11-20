part of '../location.dart';

abstract class LocationRepository {
  Future<LocationEntity> getLocation(String id);
}
