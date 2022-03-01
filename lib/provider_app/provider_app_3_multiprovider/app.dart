import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'minutes_widget_and_provider.dart';
import 'seconds_widget_and_provider.dart';

String now() => DateTime.now().toIso8601String();

// every time the duration elapses it emits the string of now
Stream<String> newStream(Duration duration) => Stream.periodic(
      duration,
      (computationCount) {
        return now();
      },
    );

class MyProviderApp3 extends StatelessWidget {
  const MyProviderApp3({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi provider')),
      body: MultiProvider(
        providers: [
          StreamProvider.value(
            value: Stream<Seconds>.periodic(
              const Duration(seconds: 1),
              ((computationCount) => Seconds()),
            ),
            initialData: Seconds(),
          ),
          StreamProvider.value(
            value: Stream<Minutes>.periodic(
              const Duration(minutes: 1),
              ((computationCount) => Minutes()),
            ),
            initialData: Minutes(),
          ),
        ],
        child: Column(
          children: [
            Row(
              children: const [
                SecondsWidget(),
                MinutesWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
