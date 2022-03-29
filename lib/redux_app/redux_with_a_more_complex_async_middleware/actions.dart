import 'dart:typed_data';

import 'package:flutter/foundation.dart';

import 'person_model.dart';

@immutable
abstract class Action {
  const Action();
}

@immutable
class LoadPeopleAction extends Action {
  const LoadPeopleAction();
}

@immutable
class SuccesfullyFetchedPeopleAction extends Action {
  final Iterable<Person> persons;

  const SuccesfullyFetchedPeopleAction({
    required this.persons,
  });
}

@immutable
class FailedToFetchPeopleAction extends Action {
  final Object error;

  const FailedToFetchPeopleAction({
    required this.error,
  });
}

@immutable
class LoadPersonImageAction extends Action {
  final String personId;

  const LoadPersonImageAction({
    required this.personId,
  });
}

@immutable
class SuccessfullyLoadedPersonImageAction extends Action {
  final String personId;
  final Uint8List imageData;

  const SuccessfullyLoadedPersonImageAction({
    required this.personId,
    required this.imageData,
  });
}
