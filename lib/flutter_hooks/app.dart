import 'package:flutter/material.dart';

import 'memoized_future.dart';
import 'stream_example.dart';
import 'text_controller_example.dart';
import 'use_applifecycle_example.dart';
import 'use_listenable_example.dart';
import 'scrolling_example.dart';
import 'use_stream_controller_example.dart';
import 'use_reducer_example.dart';

Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (computationCount) => DateTime.now().toIso8601String(),
    );

const String streamExample = 'stream-example';
const String textControllerExample = 'text-controller-example';
const String futureExample = 'future-example';
const String listenableExample = 'listenable-example';
const String scrollingExample = 'scrolling-example';
const String streamControllerExample = 'stream-controller-example';
const String reducerExample = 'reducer-example';
const String appLifeCycleExample = 'appLifeCycle-example';

class MyFlutterHookApp extends StatelessWidget {
  const MyFlutterHookApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        streamExample: (context) => const StreamExample(),
        textControllerExample: (context) => const TextControllerExample(),
        futureExample: (context) => const FutureExample(),
        listenableExample: (context) => const ListenableExample(),
        scrollingExample: (context) => const ScrollingExample(),
        streamControllerExample: (context) =>
            const UseStreamControllerExample(),
        reducerExample: (context) => const UseReducerExample(),
        appLifeCycleExample: (context) => const UseAppLifeCycleExample(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Hooks example')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('useStream example'),
            onTap: () {
              Navigator.of(context).pushNamed(streamExample);
            },
          ),
          ListTile(
            title: const Text('useState, useEffect, useTextController example'),
            onTap: () {
              Navigator.of(context).pushNamed(textControllerExample);
            },
          ),
          ListTile(
            title: const Text('useFuture example'),
            onTap: () {
              Navigator.of(context).pushNamed(futureExample);
            },
          ),
          ListTile(
            title: const Text('useListenable example'),
            onTap: () {
              Navigator.of(context).pushNamed(listenableExample);
            },
          ),
          ListTile(
            title: const Text('scrolling example'),
            onTap: () {
              Navigator.of(context).pushNamed(scrollingExample);
            },
          ),
          ListTile(
            title: const Text('useStreamController example'),
            onTap: () {
              Navigator.of(context).pushNamed(streamControllerExample);
            },
          ),
          ListTile(
            title: const Text('use reducer example'),
            onTap: () {
              Navigator.of(context).pushNamed(reducerExample);
            },
          ),
          ListTile(
            title: const Text('useAppLifeCycle example'),
            onTap: () {
              Navigator.of(context).pushNamed(appLifeCycleExample);
            },
          ),
        ],
      ),
    );
  }
}
