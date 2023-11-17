part of core;

class GqlClient {
  GraphQLClient get gqlClient => GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(AppConfig.baseRickAndMortyUrl),
      );
}
