import 'package:flutter/foundation.dart';

import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginErrors? loginErrors;
  final LoginHandle? loginHandle;
  final Iterable<Note>? fetchedNotes;

  const AppState.empty()
      : isLoading = false,
        loginErrors = null,
        loginHandle = null,
        fetchedNotes = null;

  const AppState({
    required this.isLoading,
    required this.loginErrors,
    required this.loginHandle,
    required this.fetchedNotes,
  });

  @override
  String toString() {
    return {
      'isLoading': isLoading,
      'loginErrors': loginErrors,
      'loginHandle': loginHandle,
      'fetchedNotes': fetchedNotes,
    }.toString();
  }
}
