import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseAppLifeCycleExample extends HookWidget {
  const UseAppLifeCycleExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();

    print('state $state');

    return Scaffold(
      appBar: AppBar(title: const Text('useAppLifeCycle example')),
      body: Align(
        alignment: Alignment.topCenter,
        child: Opacity(
          opacity: state == AppLifecycleState.resumed ? 1.0 : 0,
          child: Container(
            // width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withAlpha(100),
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Image.asset('lib/flutter_hooks/assets/card.jpeg'),
          ),
        ),
      ),
    );
  }
}
