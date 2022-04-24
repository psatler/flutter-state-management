import 'package:flutter/material.dart';

import 'core/stores/app_redux.dart';
import 'features/tasks/tasks.dart';
import 'features/home/home.dart';

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
        routes: {
          HomePage.routeName: (context) => const HomePageConnector(),
          AddTaskPage.routeName: (context) => const AddTaskPage(),
          TaskDetailsPage.routeName: (context) => const TaskDetailsPage(),
        },
      ),
    );
  }
}
