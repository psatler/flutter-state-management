import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/_dart/extensions/log_extension.dart';

import '../extensions/subscript_iterables.dart';
import 'bloc/bloc_actions.dart';
import 'bloc/person.dart';
import 'bloc/persons_bloc.dart';

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => jsonDecode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

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
                      context.read<PersonsBloc>().add(
                            const LoadPersonsAction(
                              personUrl1,
                              getPersons,
                            ),
                          );
                    },
                    child: const Text('Load json 1'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<PersonsBloc>().add(
                            const LoadPersonsAction(
                              personUrl2,
                              getPersons,
                            ),
                          );
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
