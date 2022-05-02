import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Client {
  ValueNotifier<GraphQLClient> getClient() {
    final HttpLink httpLink = HttpLink(
      'https://api.github.com/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
      // OR
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );

    return client;
  }
}

class AppGraphQLWrapper extends StatelessWidget {
  final Widget child;

  const AppGraphQLWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Client().getClient(),
      child: child,
    );
  }
}
