part of '../location.dart';

class LocationModel extends domain.LocationEntity {
  const LocationModel({
    required super.name,
    required super.type,
    required super.dimension,
    required super.created,
  });

  factory LocationModel.fromMap({required Map map}) => LocationModel(
        name: map['name'],
        type: map['type'],
        dimension: map['dimension'],
        created: map['created'],
      );
}
