part of '../character.dart';

class CharacterModel extends domain.CharacterEntity {
  const CharacterModel({
    required super.name,
    required super.image,
    required super.species,
    required super.gender,
    required super.status,
  });

  factory CharacterModel.fromMap({required Map<String, String> map}) =>
      CharacterModel(
        name: map['name']!,
        image: map['image']!,
        species: map['species']!,
        gender: map['gender']!,
        status: map['status']!,
      );
}
