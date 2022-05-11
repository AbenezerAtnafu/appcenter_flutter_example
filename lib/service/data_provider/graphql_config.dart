import 'package:flutter/material.dart';
import 'package:flutter_job_one/utils/custom_header.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  // TODO: get the token from localstorage
  // static String token = 'Px5OR2ps40MtsRX_BSvkgw';
  static String token = 'Px5OR2ps40MtsRX_BSvkgw';
  static String clientId = 'qjukJdK7FYnbx16qPHAmYQ';
  static String uid = 'se.michael.solomon@gmail.com';
  static String expiry = '165339749';
  static String tokenType = 'Bearer';

  // TODO: move the link to environment varibale
  static HttpLink httpLink = HttpLink(
    'https://staging-verenda.herokuapp.com/graphql/',
  );

  static ValueNotifier<GraphQLClient> graphInit() {
    // final AuthLink authLink = AuthLink(
    //   getToken: () async => 'Bearer $token',
    // );
    // Helper.getUserData().then((value) {
    //   print(value.userLogin!.authenticatable!.email);
    // });
    CustomAuthLink authLink = CustomAuthLink(
        getHeaders: () => {
              'access_token': '$token',
              'client': '$clientId',
              'expiry': '$expiry',
              'tokenType': '$tokenType',
              'uid': '$uid',
            });

    final Link link = authLink.concat(httpLink);

    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );

    return client;
  }

  GraphQLClient clientToQuery() {
    // final AuthLink authLink = AuthLink(
    //   getToken: () async => 'Bearer $token',
    // );

    CustomAuthLink authLink = CustomAuthLink(
        getHeaders: () => {
              'access_token': '$token',
              'client': '$clientId',
              'expiry': '$expiry',
              'tokenType': '$tokenType',
              'uid': '$uid',
            });

    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: link,
    );
  }
}
