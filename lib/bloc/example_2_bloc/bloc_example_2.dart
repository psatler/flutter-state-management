import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/_dart/extensions/log_extension.dart';

import '../extensions/subscript_iterables.dart';

// ignore: slash_for_doc_comments
/**
 * [
      {
        "name": "Foo3",
        "age": 32
      },
      {
        "name": "Foo4",
        "age": 12
      }
    ]
 */

enum PersonUrl {
  person1('person1'),
  person2('person2');

  final String name;
  const PersonUrl(this.name);

  String get urlString {
    switch (this) {
      case PersonUrl.person1:
        return 'https://mocki.io/v1/94cf5c4d-cc1e-4cf7-b954-c76dd9472020';
      case PersonUrl.person2:
        return 'https://mocki.io/v1/05bbe37d-937e-425e-b383-6e3f0de60095';
    }
  }
}

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  final PersonUrl personUrl;

  const LoadPersonsAction(this.personUrl);
}

class Person {
  final String name;
  final int age;
  Person({
    required this.name,
    required this.age,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;

  @override
  String toString() => 'Person(name: $name, age: $age)';
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => jsonDecode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

@immutable
class FetchResult {
  final Iterable<Person> persons;
  final bool isRetrivedFromCache;

  const FetchResult({
    required this.persons,
    required this.isRetrivedFromCache,
  });

  @override
  String toString() =>
      'FetchResult(persons: $persons, isRetrivedFromCache: $isRetrivedFromCache)';
}

class PersonsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};

  PersonsBloc() : super(null) {
    on<LoadPersonsAction>((event, emit) async {
      final url = event.personUrl;

      if (_cache.containsKey(url)) {
        final cachedPersons = _cache[url]!;
        final result = FetchResult(
          persons: cachedPersons,
          isRetrivedFromCache: true,
        );

        emit(result);

        return;
      }

      final persons = await getPersons(url.urlString);
      _cache[url] = persons;

      final result = FetchResult(persons: persons, isRetrivedFromCache: false);
      emit(result);
    });
  }
}

class BlocExample2 extends StatelessWidget {
  const BlocExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersonsBloc(),
      child: Builder(builder: (context) {
        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<PersonsBloc>()
                          .add(const LoadPersonsAction(PersonUrl.person1));
                    },
                    child: const Text('Load json 1'),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<PersonsBloc>()
                          .add(const LoadPersonsAction(PersonUrl.person2));
                    },
                    child: const Text('Load json 2'),
                  ),
                ],
              ),
              BlocBuilder<PersonsBloc, FetchResult?>(
                buildWhen: (previous, current) {
                  return previous?.persons != current?.persons;
                },
                builder: (context, fetchResultState) {
                  fetchResultState?.log();

                  final persons = fetchResultState?.persons;

                  if (persons == null) return const SizedBox.shrink();

                  return Expanded(
                      child: ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: (context, index) {
                      final person = persons[index]!;

                      return ListTile(
                        title: Text(person.name),
                        // subtitle: Text(person.age.toString()),
                      );
                    },
                  ));
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
