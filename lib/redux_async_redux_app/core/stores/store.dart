import 'package:async_redux/async_redux.dart';
import 'package:flutter_state_management/redux_async_redux_app/core/stores/state.dart';

const state = AppState.initialState();

var store = Store<AppState>(
  initialState: state,
);
