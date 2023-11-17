part of '../locations.dart';

class SingleLocationModel extends domain.SingleLocationEntity {
  const SingleLocationModel({
    required super.name,
    required super.id,
  });

  factory SingleLocationModel.fromMap({required map}) => SingleLocationModel(
        name: map['name'],
        id: map['id'],
      );
}
