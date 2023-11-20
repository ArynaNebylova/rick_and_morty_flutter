part of '../characters.dart';

class SingleCharacterModel extends domain.SingleCharacterEntity {
  const SingleCharacterModel({
    required super.name,
    required super.id,
  });

  factory SingleCharacterModel.fromMap({required Map<String, dynamic> map}) =>
      SingleCharacterModel(
        name: map['name']! as String,
        id: map['id']! as String,
      );
}
