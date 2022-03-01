import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

@immutable
class Minutes {
  final String value;
  Minutes() : value = now();
}

class MinutesWidget extends StatelessWidget {
  const MinutesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minutes = context.watch<Minutes>();

    return Expanded(
      child: Container(
        color: Colors.blue,
        height: 100,
        child: Text(minutes.value),
      ),
    );
  }
}
