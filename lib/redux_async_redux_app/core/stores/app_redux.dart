import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'app_state.dart';
import 'store.dart';

class AppRedux extends StatelessWidget {
  final Widget child;

  const AppRedux({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: child,
    );
  }
}
