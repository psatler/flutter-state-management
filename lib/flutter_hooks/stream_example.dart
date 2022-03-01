import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'app.dart';

class StreamExample extends HookWidget {
  const StreamExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());

    return Scaffold(
      appBar: AppBar(title: Text(dateTime.data ?? 'Flutter Hooks example')),
    );
  }
}
