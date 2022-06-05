import 'package:flutter/material.dart';

import 'abstract_classes/abstract_classes.dart';

class DartConcepts extends StatelessWidget {
  const DartConcepts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testItAbstractClasses();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dart')),
      ),
    );
  }
}
