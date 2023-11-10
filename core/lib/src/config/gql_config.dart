part of core;

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(AppConfig.baseRickAndMortyUrl);

  static GraphQLClient client() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}
