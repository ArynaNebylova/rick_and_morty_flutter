part of '../characters.dart';

abstract class GraphQLService {
  Future<dynamic> getCharacters(int page);
}
