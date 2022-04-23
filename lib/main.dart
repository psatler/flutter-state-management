import 'package:flutter/material.dart';

// import 'provider_app/provider_app_1/app.dart';
// import 'provider_app/provider_app_2/app.dart';
// import 'provider_app/provider_app_3_multiprovider/app.dart';
// import 'flutter_hooks/app.dart';
// import 'redux_app/redux_app_basic/app.dart';
// import 'redux_app/redux_with_async_middleware/app.dart';
// import 'redux_app/redux_with_a_more_complex_async_middleware/app.dart';
import 'redux_async_redux_app/app.dart';

void main() {
  // runApp(const MyProviderApp1());
  // runApp(const MyProviderApp2());
  // runApp(const MyFlutterHookApp());
  // runApp(const MyReduxAppBasic());
  // runApp(const MyReduxAppAsync());
  // runApp(const MyReduxAppAsyncMoreComplex());
  runApp(const AsyncReduxApp());
}
