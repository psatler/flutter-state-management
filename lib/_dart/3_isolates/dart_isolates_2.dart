// Trying to send more than one message back to the spawner
import 'dart:isolate';

import 'package:flutter_state_management/_dart/extensions/log_extension.dart';

// the entrance function
Stream<String> getMessages() {
  final rp = ReceivePort();

  return Isolate.spawn(_getMessages, rp.sendPort)
      .asStream()
      .asyncExpand((_) => rp) // changing the datatype to rp's datatype
      .takeWhile((element) => element is String)
      .cast();
}

// main function of our isolate. It takes it some sort of SendPort which it uses to communicate with the entrance function,
// and it does something. It's a void function and asynchronous. This function has only one argument. You can pack anything you
// want inside this one argument by creating your own custom class, but one of those things inside the custom class needs
// to be a SendPort, because you need the SendPort to communicate back to the entrance function.
void _getMessages(SendPort sp) async {
  // it will stream the current date one second at a time via Streams

  // it will only take 10 emissions of the stream and then stop
  await for (final now
      in Stream.periodic(const Duration(seconds: 1), (computationCount) {
    return DateTime.now().toIso8601String();
  }).take(10)) {
    sp.send(now);
  }

  Isolate.exit(sp);
}

void testIsolateExample2() async {
  await for (final msg in getMessages()) {
    msg.log();
  }
}
