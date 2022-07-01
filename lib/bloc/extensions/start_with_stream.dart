import 'package:async/async.dart';

extension StartWith<T> on Stream<T> {
  // ignore: slash_for_doc_comments
  /**
   * this:          |--------- X ---------- X
   * Stream.value:  | X |
   * merge:         | X --------- X ---------- X
   */
  Stream<T> startWith(T value) => StreamGroup.merge(
        [
          this,
          Stream<T>.value(value),
        ],
      );
}
