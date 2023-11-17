part of '../characters.dart';

class GraphQLServiceImpl implements GraphQLService {
  final GqlQuery _query;
  final GqlClient _gqlClient;

  GraphQLServiceImpl({
    required GqlClient gqlClient,
    required GqlQuery query,
  })  : _query = query,
        _gqlClient = gqlClient;

  @override
  Future<Map<String, Object>> getCharacters(int page) async {
    try {
      final queryData = await _gqlClient.gqlClient.query(
        QueryOptions(
          document: gql(_query.charactersQuery),
          variables: {"page": page},
        ),
      );

      return Map<String, Object>.from(queryData.data?['characters'] as Map);
    } catch (err) {
      throw Exception(err);
    }
  }
}
