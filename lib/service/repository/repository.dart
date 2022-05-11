import 'package:flutter_job_one/service/data_provider/graphql_config.dart';
import 'package:flutter_job_one/service/data_provider/mutations.dart';
import 'package:flutter_job_one/service/data_provider/queries.dart';
import 'package:flutter_job_one/service/models/Code.dart';
import 'package:flutter_job_one/service/models/Listing.dart';
import 'package:flutter_job_one/service/models/VerifyUser.dart';
import 'package:flutter_job_one/service/models/user.dart';
import 'package:flutter_job_one/service/models/userSignUp.dart';
import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiClients {
  final Queries _query = Queries();
  final Mutations _mutations = Mutations();
  final GraphQLConfig graphQLConfiguration = GraphQLConfig();

  Future<dynamic> login(String email, String password) async {
    User user = User();
    try {
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      final QueryResult result = await _client.mutate(
        MutationOptions(
          document: parseString(
            _mutations.userLogin(email, password),
          ),
        ),
      );
      if (result.hasException) {
        return result.exception?.graphqlErrors[0].message;
      } else if (result.data != null) {
        user = User.fromJson(result.data as Map<String, dynamic>);
        return user;
      }
    } catch (e) {
      return 'Something went wrong!';
    }
  }

  Future<dynamic> signUp(String fullName, String email, String password) async {
    UserSignedUp user = UserSignedUp();
    try {
      final GraphQLClient _client = graphQLConfiguration.clientToQuery();
      final QueryResult result = await _client.mutate(
        MutationOptions(
          document: parseString(
            _mutations.userSignUp(fullName, email, password),
          ),
        ),
      );
      if (result.hasException) {
        return result.exception?.graphqlErrors[0].message;
      } else if (result.data != null) {
        user = UserSignedUp.fromJson(result.data as Map<String, dynamic>);

        return user;
      }
    } catch (e) {
      return 'Something went wrong!';
    }
  }

  Future<dynamic> requestCode(String phoneNumber) async {
    Code code = Code();
    try {
      final GraphQLClient _client = graphQLConfiguration.clientToQuery();
      final QueryResult result = await _client.mutate(
        MutationOptions(
          document: parseString(
            _mutations.requestCode(phoneNumber),
          ),
        ),
      );
      if (result.hasException) {
        print(11111);
        return result.exception?.graphqlErrors[0].message;
      } else if (result.data != null) {
        print(2222);
        code = Code.fromJson(result.data as Map<String, dynamic>);
        print(code);
        return code;
      }
    } catch (e) {
      print(3333);
      return 'Something went wrong!';
    }
  }

  Future<dynamic> verifyCode(String? requestId, String code) async {
    VerifyUser verifyUser = VerifyUser();
    try {
      final GraphQLClient _client = graphQLConfiguration.clientToQuery();
      final QueryResult result = await _client.mutate(
        MutationOptions(
          document: parseString(
            _mutations.verifyCode(requestId, code),
          ),
        ),
      );
      if (result.hasException) {
        print(11111);
        return result.exception?.graphqlErrors[0].message;
      } else if (result.data != null) {
        print(2222);
        verifyUser = VerifyUser.fromJson(result.data as Map<String, dynamic>);
        print(verifyUser);
        return verifyUser;
      }
    } catch (e) {
      print(3333);
      return 'Something went wrong!';
    }
  }

  Future<dynamic> listings(
      int page, int limit, dynamic filter, dynamic sort) async {
    Listing listing = Listing();
    try {
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      final QueryResult result = await _client.query(
        QueryOptions(
          document: parseString(
            _query.listings(page, limit, filter, sort),
          ),
        ),
      );
      if (result.hasException) {
        print('message');
        print(result.exception?.graphqlErrors[0].message);
        return result.exception?.graphqlErrors[0].message;
      } else if (result.data != null) {
        listing = Listing.fromJson(result.data as Map<String, dynamic>);
        print('listing');
        print(listing.listings!.collection![0].currency!.name);
        return listing;
      }
    } catch (e) {
      return 'Something went wrong!';
    }
  }
}
