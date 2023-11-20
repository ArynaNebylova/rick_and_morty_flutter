part of '../character.dart';

class CharacterModel extends domain.CharacterEntity {
  const CharacterModel({
    required super.name,
    required super.image,
    required super.species,
    required super.gender,
    required super.status,
  });

  factory CharacterModel.fromMap({required Map<String, dynamic> map}) =>
      CharacterModel(
        name: map['name']! as String,
        image: map['image']! as String,
        species: map['species']! as String,
        gender: map['gender']! as String,
        status: map['status']! as String,
      );
}
