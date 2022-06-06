import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:async/async.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/_dart/extensions/log_extension.dart';

import 'model/person.dart';

// the sendPort in Request should come from a ReceivePort, so we need a class that contains this ReceivePort. However, the ReceivePort cannot be sent over to the Isolate main function
// as shown at https://api.dart.dev/stable/2.17.3/dart-isolate/SendPort/send.html. Therefore, we need another class: one that has not only the Uri, but also the ReceivePort
// We gonna call it PersonsRequest. Using the PersonsRequest class we are going to create instances of the Request class.

@immutable
class PersonsRequest {
  final ReceivePort receivePort;
  final Uri uri;

  const PersonsRequest({
    required this.receivePort,
    required this.uri,
  });

  static Iterable<PersonsRequest> all() sync* {
    for (final i in Iterable.generate(3, (index) => index)) {
      yield PersonsRequest(
        receivePort: ReceivePort(),
        uri: Uri.parse('https://jsonplaceholder.typicode.com/users'),
        // uri: Uri.parse('https://jsonplaceholder.typicode.com/users/${i + 1}'),
      );
    }
  }
}

@immutable
class Request {
  final SendPort sendPort;
  final Uri uri;

  const Request({
    required this.sendPort,
    required this.uri,
  });

  Request.from(PersonsRequest personsRequest)
      : sendPort = personsRequest.receivePort.sendPort,
        uri = personsRequest.uri;
}

// #########
Stream<Iterable<Person>> getPersonsExample3() {
  final streams = PersonsRequest.all().map((req) =>
      Isolate.spawn(_getPersons, Request.from(req))
          .asStream()
          .asyncExpand((_) => req.receivePort)
          .takeWhile((element) => element is Iterable<Person>)
          .cast());

  // merging all 3 streams into one
  return StreamGroup.merge(streams).cast();
}

void _getPersons(Request request) async {
  final persons = await HttpClient()
      .getUrl(request.uri)
      .then((req) => req.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((jsonString) => jsonDecode(jsonString) as List<dynamic>)
      .then((json) => json.map((person) => Person.fromMap(person)));

  // request.sendPort.send(persons);

  // another way of doing line 72
  Isolate.exit(request.sendPort,
      persons); // with exit it's cheaper because we are not copying data when passing messages between the main isolate function and the entrance function
}

void testIsolateExample3() async {
  await for (final msg in getPersonsExample3()) {
    msg.log();
  }
}
