part of '../characters.dart';

abstract class GraphQLService {
  Future<Map<String, Object>> getCharacters(int page);
}
