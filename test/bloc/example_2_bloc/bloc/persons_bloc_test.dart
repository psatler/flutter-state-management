import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_state_management/bloc/example_2_bloc/bloc/bloc_actions.dart';
import 'package:flutter_state_management/bloc/example_2_bloc/bloc/person.dart';
import 'package:flutter_state_management/bloc/example_2_bloc/bloc/persons_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

const mockedPerson1 = [
  Person(name: "Foo", age: 20),
  Person(name: "Baz", age: 32),
];

const mockedPerson2 = [
  Person(name: "John", age: 17),
  Person(name: "Doe", age: 42),
];

Future<Iterable<Person>> mockGetPersons1(String _) =>
    Future.value(mockedPerson1);

Future<Iterable<Person>> mockGetPersons2(String _) =>
    Future.value(mockedPerson2);

void main() {
  group('Testing bloc', () {
    late PersonsBloc bloc;

    setUp(() {
      bloc = PersonsBloc();
    });

    blocTest<PersonsBloc, FetchResult?>(
      'Test initial state',
      build: () => bloc,
      verify: (bloc) => expect(bloc.state, null),
    );

    // fetch mock data (persons1) and compare it with FetchResult
    blocTest<PersonsBloc, FetchResult?>(
      'Mock retrieving persons from first iterable',
      build: () => bloc,
      act: (bloc) {
        bloc.add(const LoadPersonsAction('dummyUrl', mockGetPersons1));
        bloc.add(const LoadPersonsAction('dummyUrl', mockGetPersons1));
      },
      expect: () => [
        const FetchResult(persons: mockedPerson1, isRetrivedFromCache: false),
        const FetchResult(persons: mockedPerson1, isRetrivedFromCache: true),
      ],
    );

    // fetch mock data (persons2) and compare it with FetchResult
    blocTest<PersonsBloc, FetchResult?>(
      'Mock retrieving persons from second iterable',
      build: () => bloc,
      act: (bloc) {
        bloc.add(const LoadPersonsAction('dummyUrl', mockGetPersons2));
        bloc.add(const LoadPersonsAction('dummyUrl', mockGetPersons2));
      },
      expect: () => [
        const FetchResult(persons: mockedPerson2, isRetrivedFromCache: false),
        const FetchResult(persons: mockedPerson2, isRetrivedFromCache: true),
      ],
    );
  });
}
