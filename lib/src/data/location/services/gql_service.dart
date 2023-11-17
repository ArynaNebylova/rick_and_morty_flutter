part of '../location.dart';

abstract class GraphQLService {
  Future<Map?> getLocation(String id);
}
