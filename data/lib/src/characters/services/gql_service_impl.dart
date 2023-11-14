part of characters;

class GraphQLServiceImpl implements GraphQLService {
  final GqlQuery _query;
  final GqlClient _gqlClient;

  GraphQLServiceImpl({
    required GqlClient gqlClient,
    required GqlQuery query,
  })  : _query = query,
        _gqlClient = gqlClient;

  @override
  Future<dynamic> getCharacters(int page) async {
    try {
      final queryData = await _gqlClient.gqlClient.query(
        QueryOptions(
          document: gql(_query.charactersQuery),
          variables: {"page": page},
        ),
      );

      return queryData.data?['characters'];
    } catch (err) {
      throw Exception(err);
    }
  }
}
