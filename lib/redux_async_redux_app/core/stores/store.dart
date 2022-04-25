import 'package:async_redux/async_redux.dart';
import 'package:flutter_state_management/redux_async_redux_app/core/services/services.dart';

import 'app_state.dart';

const state = AppState.initialState();

var store = Store<AppState>(
  initialState: state,
  environment: AppServicesImpl(
    // https://pub.dev/packages/async_redux#how-to-interact-with-the-database or
    // https://pub.dev/packages/async_redux#dependency-injection
    httpService: DioService(),
  ),
  // actionObservers: kReleaseMode ? null : [ConsoleActionObserver()],
  // modelObserver: DefaultModelObserver(),
);
