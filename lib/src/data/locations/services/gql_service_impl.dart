part of '../locations.dart';

class GraphQLServiceImpl implements GraphQLService {
  final GqlQuery _query;
  final GqlClient _gqlClient;

  GraphQLServiceImpl({
    required GqlClient gqlClient,
    required GqlQuery query,
  })  : _query = query,
        _gqlClient = gqlClient;

  @override
  Future<dynamic> getLocations(int page) async {
    try {
      final queryData = await _gqlClient.gqlClient.query(
        QueryOptions(
          document: gql(_query.locationsQuery),
          variables: {"page": page},
        ),
      );

      return queryData.data?['locations'];
    } catch (err) {
      throw Exception(err);
    }
  }
}
