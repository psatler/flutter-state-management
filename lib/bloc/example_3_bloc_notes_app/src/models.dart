import 'package:flutter/foundation.dart';

enum LoginErrors {
  invalidHandle,
}

@immutable
class LoginHandle {
  final String token;

  const LoginHandle({
    required this.token,
  });

  const LoginHandle.foobar() : token = 'foobar';

  @override
  operator ==(covariant LoginHandle other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'LoginHandle(token: $token)';
}

@immutable
class Note {
  final String title;

  const Note({
    required this.title,
  });

  @override
  String toString() => 'Note(title: $title)';
}

final mockedNotes = Iterable.generate(
  3,
  (index) => Note(title: 'Note ${index + 1}'),
);
