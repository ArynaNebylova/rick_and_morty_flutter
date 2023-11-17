part of '../locations.dart';

class LocationsEntity {
  final List<SingleLocationEntity> locations;
  final int? nextPage;

  const LocationsEntity({
    required this.locations,
    required this.nextPage,
  });
}
