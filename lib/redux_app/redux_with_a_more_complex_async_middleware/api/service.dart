import 'dart:convert';
import 'dart:io';

import '../person_model.dart';

const apiUrl =
    'http://127.0.0.1:5500/lib/redux_app/redux_with_a_more_complex_async_middleware/api/people.json';

Future<Iterable<Person>> getPersons() => HttpClient()
    .getUrl(Uri.parse(apiUrl))
    .then((req) => req.close())
    .then((response) => response.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));
