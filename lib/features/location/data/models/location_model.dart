part of data;

class LocationModel extends domain.LocationEntity {
  const LocationModel({
    required final String name,
    required final String type,
    required final String dimension,
    required final String created,
  }) : super(name: name, type: type, dimension: dimension, created: created);

  factory LocationModel.fromMap({required Map map}) => LocationModel(
        name: map['name'],
        type: map['type'],
        dimension: map['dimension'],
        created: map['created'],
      );
}
