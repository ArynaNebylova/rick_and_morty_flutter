import 'package:graphql_flutter/graphql_flutter.dart';

import './constants.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(GraphQLConstants.baseRickAndMortyUrl);

  GraphQLClient client() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}
