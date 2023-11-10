part of characters;

class GraphQLServiceImpl implements GraphQLService {
  final GraphQLClient _graphQLClient;
  final GqlQuery _query;

  GraphQLServiceImpl({
    required GraphQLClient graphQLClient,
    required GqlQuery query,
  })  : _graphQLClient = graphQLClient,
        _query = query;

  @override
  Future<List?> getCharacters(int page) async {
    try {
      final queryData = await _graphQLClient.query(
        QueryOptions(
          document: gql(_query.charactersQuery),
          variables: {"page": page},
        ),
      );

      List? result = queryData.data?['characters']['results'];
      return result;
    } catch (err) {
      throw Exception(err);
    }
  }
}
