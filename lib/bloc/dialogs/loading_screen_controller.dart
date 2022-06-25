import 'package:flutter/foundation.dart';

/// it's an object that internally contains two function pointers.
/// We create the loading screen controller so that the loading screen itself can
/// contain a copy of this loading screen controller. If we already displayed the
/// loading screen to the user, then the loading screen will already have a copy of
/// the controller. In that case, if we need it again, we leverage that copy and only
/// updates the text or dismiss the dialog
///

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}
