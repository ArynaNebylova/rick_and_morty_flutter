part of '../character.dart';

abstract class CharacterRepository {
  Future<CharacterEntity> getCharacter(String id);
}
