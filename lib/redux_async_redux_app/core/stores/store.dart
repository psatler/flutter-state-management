import 'package:async_redux/async_redux.dart';

import 'app_state.dart';

const state = AppState.initialState();

var store = Store<AppState>(
  initialState: state,
);
