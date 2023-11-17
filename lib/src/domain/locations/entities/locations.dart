part of locations;

class LocationsEntity {
  final List<SingleLocationEntity> locations;
  final int? nextPage;

  const LocationsEntity({
    required this.locations,
    required this.nextPage,
  });
}
