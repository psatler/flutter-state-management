import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cheap_expensive_widgets.dart';
import 'object_provider.dart';

class MyProviderApp2 extends StatelessWidget {
  const MyProviderApp2({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ObjectProvider(); // note that we start the streams inside the constructor
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider with watch and select'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: CheapWidget(),
              ),
              Expanded(
                child: ExpensiveWidget(),
              ),
            ],
          ),
          Row(
            children: const [
              Expanded(child: ObjectProviderWidget()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  context.read<ObjectProvider>().stop();
                },
                child: const Text('Stop'),
              ),
              TextButton(
                onPressed: () {
                  context.read<ObjectProvider>().start();
                },
                child: const Text('Start'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
