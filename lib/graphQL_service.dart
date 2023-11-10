import 'package:rick_and_morty/character_model.dart';

import 'graphQL_cofig.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<CharacterModel>> getCharacters({required int limit}) async {
    try {
      QueryResult result =
          await client.query(QueryOptions(document: gql("""query Query{
  characters(page: 1) {
    results {
      name
      image
      species
      gender
      status

    }
  }
}"""), fetchPolicy: FetchPolicy.noCache));
      if (result.hasException) {
        throw Exception(result.exception);
      }
      List? res = result.data?['characters']['results'];
      if (res == null || res.isEmpty) {
        return [];
      }
      List<CharacterModel> list =
          res.map((e) => CharacterModel.fromMap(map: e)).toList();
      return list;
    } catch (_) {
      throw Exception(_);
    }
  }
}
