part of '../locations.dart';

class LocationsModel extends domain.LocationsEntity {
  const LocationsModel({
    required List<SingleLocationModel> super.locations,
    required super.nextPage,
  });

  factory LocationsModel.fromMap({required Map<String, dynamic> map}) =>
      LocationsModel(
        locations: parseLocations(map['results']),
        nextPage: map['info']['next'],
      );

  static List<SingleLocationModel> parseLocations(List<Object?> locations) {
    return List.generate(
      locations.length,
      (index) => SingleLocationModel.fromMap(
        map: locations[index],
      ),
    );
  }
}
