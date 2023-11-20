part of '../location.dart';

class LocationModel extends domain.LocationEntity {
  const LocationModel({
    required super.name,
    required super.type,
    required super.dimension,
    required super.created,
  });

  factory LocationModel.fromMap({required Map<String, dynamic> map}) =>
      LocationModel(
        name: map['name']! as String,
        type: map['type']! as String,
        dimension: map['dimension']! as String,
        created: map['created']! as String,
      );
}
