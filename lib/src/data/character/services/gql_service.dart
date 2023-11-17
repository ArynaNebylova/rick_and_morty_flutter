part of '../character.dart';

abstract class GraphQLService {
  Future<Map<String, String>> getCharacter(String id);
}
