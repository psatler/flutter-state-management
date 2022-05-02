import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_management/flutter_with_graphql/graphql/app_graphql_wrapper.dart';

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
          HomePage.routeName: (context) => const HomePage(),
          HomePageWithHooks.routeName: (context) => const HomePageWithHooks(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomePageWithHooks extends HookWidget {
  const HomePageWithHooks({Key? key}) : super(key: key);

  static const String routeName = '/home_with_hooks';

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
