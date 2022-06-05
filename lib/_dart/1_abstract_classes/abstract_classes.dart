import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/_dart/extensions/log_extension.dart';

enum Type { cat, dog }

abstract class CanRun {
  final Type classType;

  const CanRun({
    required this.classType,
  });

  String get type {
    // reflecting to the subtypes that extends this class
    if (this is Cat) {
      return 'Cat';
    }

    return 'Something else';
  }

  @mustCallSuper // <<<<<<------------------------
  void run() {
    "CanRun's run method is called".log();
  }
}

class Cat extends CanRun {
  Cat() : super(classType: Type.cat);

  @override
  void run() {
    super.run();

    "Cat run".log();
  }
}

class Dog extends CanRun {
  Dog() : super(classType: Type.dog);
}

// abstract classes as mixins
abstract class CanRunAsMixin {
  // when abstract classes don't have constructors, they can be mixed into existing classes
  void run() {
    'Running'.log();
  }
}

abstract class CanWalkAsMixin {
  void walk() {
    'Walking'.log();
  }
}

class CatWalkRun with CanRunAsMixin, CanWalkAsMixin {}

void testItAbstractClasses() {
  final cat = Cat();
  cat.run();
  final dog = Dog();
  dog.run();

  // printing the types
  cat.type.log();
  dog.type.log();

  // printing the types
  cat.classType.log();
  dog.classType.log();

  // abstract classes as mixins
  final catWalkRun = CatWalkRun();
  catWalkRun
    ..run()
    ..walk();
}

// Output
// [log] CanRun's run method is called
// [log] Cat run
// [log] CanRun's run method is called
// [log] Cat
// [log] Something else
// [log] Type.cat
// [log] Type.dog
// [log] Running
// [log] Walking
