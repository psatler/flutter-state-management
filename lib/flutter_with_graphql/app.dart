import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_management/flutter_with_graphql/components/query_wrapper.dart';
import 'package:flutter_state_management/flutter_with_graphql/graphql/queries/country/country.graphql.dart';
import 'package:flutter_state_management/flutter_with_graphql/pages/mutation_with_hooks.dart';
import 'package:flutter_state_management/flutter_with_graphql/pages/mutations.dart';

import 'graphql/app_graphql_wrapper.dart';
import 'graphql/queries/country/country_query_string.dart';

class FlutterWithGraphQLApp extends StatelessWidget {
  const FlutterWithGraphQLApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppGraphQLWrapper(
      child: MaterialApp(
        title: 'Flutter GraphQL',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Root.routeName: (context) => const Root(),
          HomePage.routeName: (context) => const HomePage(),
          HomePageWithHooks.routeName: (context) => const HomePageWithHooks(),
          HomePageWithWrapper.routeName: (context) =>
              const HomePageWithWrapper(),
          MutationExample1.routeName: (context) => const MutationExample1(),
          MutationExample2WithHooks.routeName: (context) =>
              const MutationExample2WithHooks(),
        },
      ),
    );
  }
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GraphQL Flutter')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Normal Query Widget'),
                onTap: () {
                  Navigator.pushNamed(context, HomePage.routeName);
                },
              ),
              ListTile(
                title: const Text('Normal Query Widget using a custom wrapper'),
                onTap: () {
                  Navigator.pushNamed(context, HomePageWithWrapper.routeName);
                },
              ),
              ListTile(
                title: const Text('Query Widget with Hooks'),
                onTap: () {
                  Navigator.pushNamed(context, HomePageWithHooks.routeName);
                },
              ),
              ListTile(
                title: const Text('Mutation example'),
                onTap: () {
                  Navigator.pushNamed(context, MutationExample1.routeName);
                },
              ),
              ListTile(
                title: const Text('Mutation example with Hooks'),
                onTap: () {
                  Navigator.pushNamed(
                      context, MutationExample2WithHooks.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageWithWrapper extends StatelessWidget {
  const HomePageWithWrapper({Key? key}) : super(key: key);

  static const String routeName = '/home_page_wrapper';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: QueryWrapper<Query$SingleCountry>(
        // This is obsolete now with the graphql codegen
        queryString: COUNTRY_QUERY_STRING,
        dataParser: (json) => Query$SingleCountry.fromJson(json),
        variables: const {
          "countryId": "AD",
        },
        contentBuilder: (data) {
          final country = data.country;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(country?.name ?? ''),
                Text(country?.code ?? ''),
                Text(country?.phone ?? ''),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // using the generated graphql code
      body: SafeArea(
        child: Query$SingleCountry$Widget(
          options: Options$Query$SingleCountry(
            variables: Variables$Query$SingleCountry(countryId: "AD"),
          ),
          builder: (result, {fetchMore, refetch}) {
            final parsed = result.parsedData;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(parsed?.country?.name ?? ''),
                  Text(parsed?.country?.code ?? ''),
                  Text(parsed?.country?.phone ?? ''),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePageWithHooks extends HookWidget {
  const HomePageWithHooks({Key? key}) : super(key: key);

  static const String routeName = '/home_with_hooks';

  @override
  Widget build(BuildContext context) {
    // final queryResult = useQueryWith<QuerySingleCountry>(
    //   QueryOptions(
    //     document: QUERY_SINGLE_COUNTRY,
    //     variables: const {
    //       "countryId": "AD",
    //     },
    //     // parserFn: (json) => QuerySingleCountry.fromJson(json),
    //   ),
    // );
    final queryResult = useQuery$SingleCountry(
      Options$Query$SingleCountry(
        variables: Variables$Query$SingleCountry(countryId: "AD"),
      ),
    );

    // useQuery(
    //   QueryOptions(
    //     document: QUERY_SINGLE_COUNTRY,
    // variables: const {
    //   "countryId": "AD",
    // },
    //     parserFn: QuerySingleCountry.fromJson,
    //     // parserFn: (json) => QuerySingleCountry.fromJson(json),
    //   ),
    // );

    if (queryResult.result.hasException) {
      return Text(queryResult.result.exception.toString());
    }
    if (queryResult.result.isLoading) {
      return const Text("LOADING");
    }
    final data = queryResult.result.parsedData;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data?.country?.name ?? ''),
            Text(data?.country?.code ?? ''),
            Text(data?.country?.phone ?? ''),
          ],
        ),
      ),
    );
  }
}
