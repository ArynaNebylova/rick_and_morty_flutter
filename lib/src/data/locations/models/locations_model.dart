part of '../locations.dart';

class LocationsModel extends domain.LocationsEntity {
  const LocationsModel({
    required List<SingleLocationModel> super.locations,
    required super.nextPage,
  });

  factory LocationsModel.fromMap({required Map<String, dynamic> map}) =>
      LocationsModel(
        locations: parseLocations(
          map['results']! as List<Object?>,
        ),
        nextPage: (map['info'] as Map<String, dynamic>)['next'] as int,
      );

  static List<SingleLocationModel> parseLocations(
    List<Object?> locations,
  ) {
    return List.generate(
      locations.length,
      (index) => SingleLocationModel.fromMap(
        map: locations[index]! as Map<String, dynamic>,
      ),
    );
  }
}
