import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'core/navigation/routes.dart';
import 'core/stores/app_redux.dart';
import 'core/stores/app_state.dart';

class AsyncReduxApp extends StatelessWidget {
  const AsyncReduxApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return AppRedux(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const HomePage(),
        routes: routes(context),
        // onGenerateRoute: ,
        navigatorObservers: [
          RouteNavObserver.instance.routeObserver,
        ],
      ),
    );
  }
}

class RouteNavObserver {
  static final instance = RouteNavObserver._();
  RouteNavObserver._();

  final routeObserver = RouteObserver<ModalRoute>();
}
