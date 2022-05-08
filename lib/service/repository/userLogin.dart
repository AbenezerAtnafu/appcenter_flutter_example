import 'package:flutter_job_one/service/data_provider/graphql_config.dart';
import 'package:flutter_job_one/service/data_provider/mutations.dart';
import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiClients {
  final Mutations _mutations = Mutations();

  ///Example on how to implement mutations
  Future<String> Login(String email, String password) async {
    try {
      ///initializing GraphQLConfig
      final GraphQLConfig graphQLConfiguration = GraphQLConfig();
      final GraphQLClient _client = graphQLConfiguration.clientToQuery();
      final QueryResult result = await _client.mutate(
        MutationOptions(
          document: parseString(
            _mutations.userLogin('se.michael.solomon@gmail.com', 'pass1234'),
          ), // this
        ),
      );
      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        print('get');
        print(result.data);
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }
}
