import 'package:flutter/material.dart';
import 'package:flutter_state_management/_dart/extensions/log_extension.dart';

import '1_abstract_classes/abstract_classes.dart';
import '2_mixins/dart_mixins.dart';
import '3_isolates/dart_isolates_1.dart';
import '3_isolates/dart_isolates_2.dart';
import '3_isolates/dart_isolates_3.dart';

class DartConcepts extends StatelessWidget {
  const DartConcepts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testItAbstractClasses();

    testItMixins();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dart')),
        body: Center(
          child: Column(
            children: [
              TextButton(
                child: const Text('Dart Isolates - Press me'),
                onPressed: () async {
                  final persons = await getPersons();

                  persons.log();

                  // output:
                  // [log] (Instance of 'Person', Instance of 'Person', Instance of 'Person', ..., Instance of 'Person', Instance of 'Person')
                },
              ),
              TextButton(
                child: const Text('Dart Isolates Example 2 - Press me'),
                onPressed: () {
                  testIsolateExample2();
                },
              ),
              TextButton(
                child: const Text('Dart Isolates Example 3 - Press me'),
                onPressed: () {
                  testIsolateExample3();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
