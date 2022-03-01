import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'extensions/normalize_extension.dart';

const url = 'https://bit.ly/3x7J5Qt';
const imageHeight = 300.0;

class ScrollingExample extends HookWidget {
  const ScrollingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0,
      upperBound: 1,
    );
    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0,
      upperBound: 1,
    );

    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        final newOpacity = max(imageHeight - scrollController.offset, 0.0);
        final normalized = newOpacity.normalized(0.0, imageHeight).toDouble();

        print('scrollController.offset: ${scrollController.offset}');
        print('newOpacity: $newOpacity');
        print('normalized: $normalized');

        opacity.value = normalized;
        size.value = normalized;
      });

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('useScrollController example')),
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Person $index'),
                  );
                }),
          )
        ],
      ),
    );
  }
}
