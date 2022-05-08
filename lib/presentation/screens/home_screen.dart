import 'package:flutter/material.dart';
import 'package:flutter_job_one/service/data_provider/gql_client.dart';
import 'package:flutter_job_one/service/data_provider/queries.dart';
import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GraphQLConfiguration _graphQLConfiguration = GraphQLConfiguration();
  final Queries _query = Queries();
  List profileList = List.empty();

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future fetchProfile() async {
    final GraphQLClient _client = _graphQLConfiguration.myGQLClient();

    final QueryResult result = await _client.query(
      QueryOptions(
        document: parseString(
          _query.fetchAllProfile(),
        ),
      ),
    );
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      print(result.data);
      setState(() {
        profileList = result.data?['allListings'] as List;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: profileList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('hey'),
                  ],
                ),
        ),
      ),
    );
  }
}
