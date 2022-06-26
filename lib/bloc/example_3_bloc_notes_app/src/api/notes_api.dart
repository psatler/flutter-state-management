import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/models.dart';

@immutable
abstract class NotesApiProtocol {
  const NotesApiProtocol();

  Future<Iterable<Note>?> getNotes({
    required LoginHandle loginHandle,
  });
}

class NotesApi implements NotesApiProtocol {
  @override
  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle}) async {
    final isLoggedIn = await Future.delayed(
      const Duration(seconds: 2),
      () => loginHandle == const LoginHandle.foobar(),
    );

    return isLoggedIn ? mockedNotes : null;
  }
}
