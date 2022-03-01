import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'extensions/compact_map_extension.dart';

class FutureExample extends HookWidget {
  const FutureExample({Key? key}) : super(key: key);

  static String url() => 'https://bit.ly/3qYOtDm';

  @override
  Widget build(BuildContext context) {
    // Imamge.network would do a similar thing as written below
    final future = NetworkAssetBundle(Uri.parse(url()))
        .load(url())
        .then((data) => data.buffer.asUint8List())
        .then((data) => Image.memory(data));

    final imageFuture = useMemoized(() => future); // memoizing a complex obj
    final snapshotImage = useFuture(imageFuture);

    return Scaffold(
      appBar: AppBar(title: const Text('useFuture example')),
      body: Column(
        children: [
          snapshotImage.data,
        ].compactMap().toList(),
      ),
    );
  }
}
