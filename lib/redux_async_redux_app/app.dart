import 'package:flutter/material.dart';

import 'features/tasks/tasks.dart';
import 'features/home/home.dart';

class AsyncReduxApp extends StatelessWidget {
  const AsyncReduxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        AddTask.routeName: (context) => const AddTask(),
        TaskDetails.routeName: (context) => const TaskDetails(),
      },
    );
  }
}
