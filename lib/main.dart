import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/app_router.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

final HttpLink rickAndMortyHttpLink = HttpLink(
  'https://staging-verenda.herokuapp.com/graphql',
);
ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    link: rickAndMortyHttpLink,
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
  ),
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: "Verenda.et",
        theme: ThemeData(
          primaryColor: COLOR_PRIMARY,
        ),
        initialRoute: onBoardingRoute,
        onGenerateRoute: AppRouter.generageRoute,
      ),
    );
  }
}
