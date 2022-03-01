import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'base_object.dart';

class ObjectProvider extends ChangeNotifier {
  late String id;
  late CheapObject _cheapObject;
  late StreamSubscription _cheapStreamSubs;
  late ExpensiveObject _expensiveObject;
  late StreamSubscription _expensiveStreamSubs;

  CheapObject get cheapObject => _cheapObject;
  ExpensiveObject get expensiveObject => _expensiveObject;

  ObjectProvider()
      : id = const Uuid().v4(),
        _cheapObject = CheapObject(),
        _expensiveObject = ExpensiveObject() {
    start();
  }

  @override
  void notifyListeners() {
    // setting a new id for the provider when the change occurs
    id = const Uuid().v4();

    super.notifyListeners();
  }

  // a function to kickstart the streams
  void start() {
    _cheapStreamSubs = Stream.periodic(
      const Duration(seconds: 1),
    ).listen((event) {
      _cheapObject = CheapObject();
      notifyListeners();
    });

    _expensiveStreamSubs = Stream.periodic(
      const Duration(seconds: 10),
    ).listen((event) {
      _expensiveObject = ExpensiveObject();
      notifyListeners();
    });
  }

  void stop() {
    _cheapStreamSubs.cancel();
    _expensiveStreamSubs.cancel();
  }
}
