import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    'https://staging-verenda.herokuapp.com/graphql/',
  );

  GraphQLClient myGQLClient() {
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
  }
}
