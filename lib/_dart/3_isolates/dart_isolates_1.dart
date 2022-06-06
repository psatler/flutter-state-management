import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter_state_management/_dart/3_isolates/model/person.dart';

// This is the entrance function of the isolate. This is what we will call as the consumer
Future<Iterable<Person>> getPersons() async {
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _getPersons,
    receivePort.sendPort,
  );

  // we know in only sends only value in this case, so we grab it
  return await receivePort.first;
}

// main function of the isolate. It has a "tunnel" to the entrance to be able to pass data to the entrance. The way to
// do it is by using a "SendPort".
void _getPersons(SendPort sp) async {
  const url = 'https://jsonplaceholder.typicode.com/users';
  final persons = await HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((jsonString) => jsonDecode(jsonString) as List<dynamic>)
      .then((json) => json.map((person) => Person.fromMap(person)));

  Isolate.exit(
    sp,
    persons,
  );
}
