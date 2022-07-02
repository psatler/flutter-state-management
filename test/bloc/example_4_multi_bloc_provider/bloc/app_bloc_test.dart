import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/bloc/app_bloc.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/bloc/app_state.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/bloc/bloc_events.dart';
import 'package:flutter_test/flutter_test.dart';

// extension to test the return of images
extension ToList on String {
  /// converting a String to its data representation
  Uint8List toUint8List() => Uint8List.fromList(codeUnits);
}

enum Errors {
  dummy,
}

final text1Data = 'foo'.toUint8List();
final text2Data = 'bar'.toUint8List();

void main() {
  blocTest<AppBloc, AppState>(
    'Initial state of the bloc should be empty',
    build: () {
      return AppBloc(
        urls: [],
      );
    },
    verify: (appBloc) => expect(appBloc.state, const AppState.empty()),
  );

  // load valid data and compare states
  blocTest<AppBloc, AppState>(
    'Test the ability to load a url',
    build: () {
      return AppBloc(
        urls: [],
        urlPicker: (_) => '',
        urLoader: (_) => Future.value(text1Data),
      );
    },
    act: (appBloc) => appBloc.add(const LoadNextUrlEvent()),
    expect: () {
      return [
        const AppState(isLoading: true, data: null, error: null),
        AppState(isLoading: false, data: text1Data, error: null),
      ];
    },
  );

  // throw an error in urlLoader and catch it
  blocTest<AppBloc, AppState>(
    'Throw an error in urlLoader and catch it',
    build: () {
      return AppBloc(
        urls: [],
        urlPicker: (_) => '',
        urLoader: (_) => Future.error(Errors.dummy),
      );
    },
    act: (appBloc) => appBloc.add(const LoadNextUrlEvent()),
    expect: () {
      return [
        const AppState(isLoading: true, data: null, error: null),
        const AppState(isLoading: false, data: null, error: Errors.dummy),
      ];
    },
  );

  blocTest<AppBloc, AppState>(
    'Test the ability to load more than one url',
    build: () {
      return AppBloc(
        urls: [],
        urlPicker: (_) => '',
        urLoader: (_) => Future.value(text2Data),
      );
    },
    act: (appBloc) {
      appBloc.add(const LoadNextUrlEvent());
      appBloc.add(const LoadNextUrlEvent());
    },
    expect: () {
      return [
        // events for the first url
        const AppState(isLoading: true, data: null, error: null),
        AppState(isLoading: false, data: text2Data, error: null),

        // events for the second url
        const AppState(isLoading: true, data: null, error: null),
        AppState(isLoading: false, data: text2Data, error: null),
      ];
    },
  );
}
