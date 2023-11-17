part of '../characters.dart';

class SingleCharacterModel extends domain.SingleCharacterEntity {
  const SingleCharacterModel({
    required super.name,
    required super.id,
  });

  factory SingleCharacterModel.fromMap({required Map<String, String> map}) =>
      SingleCharacterModel(
        name: map['name']!,
        id: map['id']!,
      );
}
