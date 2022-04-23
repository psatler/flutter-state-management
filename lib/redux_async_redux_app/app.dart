import 'package:flutter/material.dart';

class AsyncReduxApp extends StatelessWidget {
  const AsyncReduxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // routes: {
      //   '/new': (context) => const NewBreadCrumbWidget(),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Redux example'),
      ),
    );
  }
}
