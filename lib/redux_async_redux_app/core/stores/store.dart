import 'dart:convert';
import 'dart:developer';
import 'package:collection/collection.dart';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
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
  stateObservers: kReleaseMode
      ? null
      : <StateObserver<AppState>>[
          DevToolsStateObserver(),
        ],
);

String _prettyPrint(Map jsonObject) {
  var encoder = const JsonEncoder.withIndent('   ');
  return encoder.convert(jsonObject);
}

class DevToolsStateObserver extends StateObserver<AppState> {
  // https://pub.dev/packages/async_redux#logging
  // https://github.com/psatler/flutter-state-management/blob/redux-remote-dev-server/lib/redux_async_redux_app/core/stores/store.dart#L38
  @override
  void observe(action, stateIni, stateEnd, dispatchCount) {
    Map initialMap = stateIni.toMap();
    Map finalMap = stateEnd.toMap();

    if (DeepCollectionEquality().equals(initialMap, finalMap)) {
      print('Maps are equal');
    } else {
      print('Maps are not equal');
    }
    log('Initial');
    log(_prettyPrint(initialMap), name: 'Initial');
    log(' ');
    log(' ');
    log('Final');
    log(_prettyPrint(finalMap), name: 'Final');
  }
}
