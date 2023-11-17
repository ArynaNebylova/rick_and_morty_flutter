part of core;

class CoreDI extends DI {
  const CoreDI();

  @override
  List<SingleChildWidget> setup() {
    final gqlClient = Provider<GqlClient>(
      create: (ref) => GqlClient(),
    );

    final gqlQuery = Provider<GqlQuery>(
      create: (ref) => GqlQuery(),
    );

    return [gqlClient, gqlQuery];
  }
}
