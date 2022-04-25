import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'app_state.dart';

class AppRedux extends StatelessWidget {
  final Widget child;
  final Store<AppState> store;

  const AppRedux({
    Key? key,
    required this.child,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: child,
    );
  }
}
