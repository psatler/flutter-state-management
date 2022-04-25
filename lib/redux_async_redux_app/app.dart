import 'package:flutter/material.dart';

import 'core/navigation/routes.dart';
import 'core/stores/app_redux.dart';

class AsyncReduxApp extends StatelessWidget {
  const AsyncReduxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppRedux(
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
