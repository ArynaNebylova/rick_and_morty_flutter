part of '../locations.dart';

class LocationsModel extends domain.LocationsEntity {
  const LocationsModel({
    required List<SingleLocationModel> super.locations,
    required super.nextPage,
  });

  factory LocationsModel.fromMap({required Map<String, dynamic> map}) =>
      LocationsModel(
        locations: parseLocations(
          map['results']! as List<Map<String, dynamic>>,
        ),
        nextPage: (map['info']! as Map<String, int>)['next'],
      );

  static List<SingleLocationModel> parseLocations(
    List<Map<String, dynamic>> locations,
  ) {
    return List.generate(
      locations.length,
      (index) => SingleLocationModel.fromMap(
        map: locations[index],
      ),
    );
  }
}
