part of '../locations.dart';

abstract class GraphQLService {
  Future<dynamic> getLocations(int page);
}
