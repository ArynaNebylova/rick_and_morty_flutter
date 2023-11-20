part of '../character.dart';

abstract class GraphQLService {
  Future<Map<String, dynamic>> getCharacter(String id);
}
