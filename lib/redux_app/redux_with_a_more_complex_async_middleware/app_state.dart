import 'package:flutter/foundation.dart';

import 'person_model.dart';

@immutable
class State {
  final bool isLoading;
  final Iterable<Person>? fetchedPersons;
  final Object? error;

  const State({
    required this.isLoading,
    this.fetchedPersons,
    this.error,
  });

  const State.empty()
      : isLoading = false,
        fetchedPersons = null,
        error = null;

  Iterable<Person>? get sortedFetchedPersons => fetchedPersons?.toList()
    ?..sort((p1, p2) {
      return int.parse(p1.id).compareTo(int.parse(p2.id));
    });
}
