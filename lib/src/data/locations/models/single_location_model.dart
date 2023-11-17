part of '../locations.dart';

class SingleLocationModel extends domain.SingleLocationEntity {
  const SingleLocationModel({
    required super.name,
    required super.id,
  });

  factory SingleLocationModel.fromMap({required Map<String, dynamic> map}) =>
      SingleLocationModel(
        name: map['name']! as String,
        id: map['id']! as String,
      );
}
