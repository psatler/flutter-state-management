import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/bloc/app_state.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/bloc/bloc_events.dart';

typedef AppBlocRandomUrlPicker = String Function(Iterable<String> allUrls);
typedef AppBlocUrLoader = Future<Uint8List> Function(String url);

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class AppBloc extends Bloc<AppEvent, AppState> {
  String _pickRandomUrl(Iterable<String> allUrls) => allUrls.getRandomElement();

  Future<Uint8List> _loadUrl(String url) async {
    final bundle = NetworkAssetBundle(Uri.parse(url));
    final data = (await bundle.load(url)).buffer.asUint8List();

    return data;
  }

  AppBloc({
    required Iterable<String> urls,
    Duration? waitBeforeLoading,
    AppBlocRandomUrlPicker? urlPicker,
    AppBlocUrLoader? urLoader,
  }) : super(const AppState.empty()) {
    on<LoadNextUrlEvent>((event, emit) async {
      emit(const AppState(isLoading: true, data: null, error: null));

      // final url = urlPicker?.call(urls) ?? _pickRandomUrl(urls);
      final url = (urlPicker ?? _pickRandomUrl)(urls);
      try {
        if (waitBeforeLoading != null) {
          await Future.delayed(waitBeforeLoading);
        }
        final data = await (urLoader ?? _loadUrl)(url);

        emit(AppState(isLoading: false, data: data, error: null));
      } catch (err) {
        emit(AppState(isLoading: false, data: null, error: err));
      }
    });
  }
}
