import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _url = 'https://bit.ly/3x7J5Qt';

class UseStreamControllerExample extends HookWidget {
  const UseStreamControllerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;

    controller = useStreamController<double>(onListen: () {
      controller.sink.add(0);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('useStreamController example')),
      body: StreamBuilder<double>(
          stream: controller.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final rotation = snapshot.data ?? 0.0;

            print('rotation $rotation');
            return GestureDetector(
              onTap: () {
                controller.sink.add(rotation + 10);
              },
              child: RotationTransition(
                turns: AlwaysStoppedAnimation<double>(rotation / 360.0),
                child: Center(
                  child: Image.network(_url),
                ),
              ),
            );
          }),
    );
  }
}
