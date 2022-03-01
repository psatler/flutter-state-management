import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

@immutable
class Seconds {
  final String value;
  Seconds() : value = now();
}

class SecondsWidget extends StatelessWidget {
  const SecondsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seconds = context.watch<Seconds>();

    return Expanded(
      child: Container(
        color: Colors.yellow,
        height: 100,
        child: Text(seconds.value),
      ),
    );
  }
}
