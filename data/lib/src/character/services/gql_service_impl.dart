part of character;

class GraphQLServiceImpl implements GraphQLService {
  final GqlQuery _query;
  final GraphQLConfig _gqlConfig;
  late final GraphQLClient _graphQLClient;

  GraphQLServiceImpl({
    required GraphQLConfig gqlConfig,
    required GqlQuery query,
  })  : _query = query,
        _gqlConfig = gqlConfig {
    _graphQLClient =
        GraphQLClient(link: _gqlConfig.httpLink, cache: GraphQLCache());
  }

  @override
  Future<Map?> getCharacter(String id) async {
    try {
      final queryData = await _graphQLClient.query(
        QueryOptions(
          document: gql(_query.singleCharacterQuery),
          variables: {"id": id},
        ),
      );

      return queryData.data?['character'];
    } catch (err) {
      throw Exception(err);
    }
  }
}
