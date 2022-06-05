import 'dart:developer' as devtools show log;

extension Log on Object {
  // void log() => devtools.log(this.toString());
  void log() => devtools.log(toString());
}
