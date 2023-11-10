part of characters;

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
  Future<List?> getCharacters(int page) async {
    try {
      final queryData = await _graphQLClient.query(
        QueryOptions(
          document: gql(_query.charactersQuery),
          variables: {"page": page},
        ),
      );

      return queryData.data?['characters']['results'];
    } catch (err) {
      throw Exception(err);
    }
  }
}
