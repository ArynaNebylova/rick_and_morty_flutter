part of '../core.dart';

class GqlClient {
  GraphQLClient get gqlClient => GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(AppConfig.baseRickAndMortyUrl),
      );
}
