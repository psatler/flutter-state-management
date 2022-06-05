import 'package:flutter/material.dart';

import '1_abstract_classes/abstract_classes.dart';
import '2_mixins/dart_mixins.dart';

class DartConcepts extends StatelessWidget {
  const DartConcepts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testItAbstractClasses();

    testItMixins();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dart')),
      ),
    );
  }
}
