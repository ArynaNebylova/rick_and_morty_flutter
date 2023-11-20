part of '../location.dart';

abstract class GraphQLService {
  Future<Map<String, dynamic>> getLocation(String id);
}
