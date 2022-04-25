import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/redux_async_redux_app/core/services/services.dart';

import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

import 'app_state.dart';

// This is a 'devtools store' used to wire up redux remote devtools, but our app doesn't actually care about this store
late DevToolsStore<AppState> devToolsStore;

// This observes changes to the 'store' and dispatches an event using the 'devtools store' so it is picked up by redux remote devtools
class DevToolsStateObserver extends StateObserver<AppState> {
  // https://pub.dev/packages/async_redux#logging
  @override
  void observe(_reduxAction, _stateIni, stateEnd, _dispatchCount) {
    devToolsStore.dispatch(_reduxAction.runtimeType.toString());
  }
}

Future<Store<AppState>> initStore() async {
  const state = AppState.initialState();

  // Initializing the 'store' our app cares about
  var store = Store<AppState>(
    initialState: state,
    environment: AppServicesImpl(
      // https://pub.dev/packages/async_redux#how-to-interact-with-the-database or
      // https://pub.dev/packages/async_redux#dependency-injection
      httpService: DioService(),
    ),
    // actionObservers: kReleaseMode ? null : [ConsoleActionObserver()],
    // modelObserver: DefaultModelObserver(),
    // stateObservers: [StateLogger()],
    stateObservers: kReleaseMode
        ? null
        : <StateObserver<AppState>>[
            DevToolsStateObserver(),
          ],
  );

// Initializing the 'devtools store' that our app doesn't actually care about
  final RemoteDevToolsMiddleware<AppState> remoteDevtools =
      RemoteDevToolsMiddleware<AppState>('localhost:8000');
  await remoteDevtools.connect();

  devToolsStore = DevToolsStore<AppState>(
    // Note: we are returning the state of the 'store' our app cares about
    // for any event dispatched from the 'devtools store' that our app doesn't actually care about
    (AppState _, dynamic action) => store.state,
    initialState: const AppState.initialState(),
    middleware: [remoteDevtools],
  );
  remoteDevtools.store = devToolsStore;

  return store;
}

// const state = AppState.initialState();

// var store = Store<AppState>(
//   initialState: state,
//   environment: AppServicesImpl(
//     // https://pub.dev/packages/async_redux#how-to-interact-with-the-database or
//     // https://pub.dev/packages/async_redux#dependency-injection
//     httpService: DioService(),
//   ),
//   // actionObservers: kReleaseMode ? null : [ConsoleActionObserver()],
//   // modelObserver: DefaultModelObserver(),
//   // stateObservers: [StateLogger()],
//   stateObservers: kReleaseMode ? null : <StateObserver<AppState>>[
//       DevToolsStateObserver(),
//     ],
// );
