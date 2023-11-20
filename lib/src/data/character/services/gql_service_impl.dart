part of '../character.dart';

class GraphQLServiceImpl implements GraphQLService {
  final GqlQuery _query;
  final GqlClient _gqlClient;

  GraphQLServiceImpl({
    required GqlClient gqlClient,
    required GqlQuery query,
  })  : _query = query,
        _gqlClient = gqlClient;

  @override
  Future<Map<String, dynamic>> getCharacter(String id) async {
    try {
      final queryData = await _gqlClient.gqlClient.query(
        QueryOptions(
          document: gql(_query.singleCharacterQuery),
          variables: {"id": id},
        ),
      );

      return queryData.data?['character'] as Map<String, dynamic>;
    } catch (err) {
      throw Exception(err);
    }
  }
}
