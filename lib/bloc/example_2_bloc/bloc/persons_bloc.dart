import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/bloc/example_2_bloc/bloc/person.dart';
import 'package:flutter_state_management/bloc/extensions/is_equal_ignoring_order.dart';

import 'bloc_actions.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FetchResult &&
        persons.isEqualToIgnoringOrdering(other.persons) &&
        other.persons == persons &&
        other.isRetrivedFromCache == isRetrivedFromCache;
  }

  @override
  int get hashCode => persons.hashCode ^ isRetrivedFromCache.hashCode;
}

class PersonsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<String, Iterable<Person>> _cache = {};

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
      final loader = event.loader;
      final persons = await loader(url);
      _cache[url] = persons;

      final result = FetchResult(persons: persons, isRetrivedFromCache: false);
      emit(result);
    });
  }
}
