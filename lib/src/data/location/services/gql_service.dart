part of '../location.dart';

abstract class GraphQLService {
  Future<Map<String, String>> getLocation(String id);
}
