import 'package:flutter/material.dart';

import 'stream_example.dart';
import 'text_controller_example.dart';

Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (computationCount) => DateTime.now().toIso8601String(),
    );

const String streamExample = 'stream-example';
const String textControllerExample = 'text-controller-example';

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
            title: const Text('Stream example'),
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
        ],
      ),
    );
  }
}
