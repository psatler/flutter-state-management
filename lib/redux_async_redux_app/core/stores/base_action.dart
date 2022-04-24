import 'package:async_redux/async_redux.dart';
import 'package:flutter_state_management/redux_async_redux_app/core/services/services.dart';

import 'app_state.dart';

abstract class BaseAction extends ReduxAction<AppState> {
  // https://pub.dev/packages/async_redux#dependency-injection
  @override
  AppServicesImpl get env => super.env as AppServicesImpl;
}
