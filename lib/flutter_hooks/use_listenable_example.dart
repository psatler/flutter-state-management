import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;

  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (v) => from - v)
        .takeWhile((value) => value >= 0)
        .listen((eventValue) {
      // value of ValueNotifier
      this.value = eventValue;
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

class ListenableExample extends HookWidget {
  const ListenableExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 20));
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(title: const Text('useListenable example')),
      body: Center(
          child: Text(
        notifier.value.toString(),
        style: const TextStyle(fontSize: 36),
      )),
    );
  }
}
