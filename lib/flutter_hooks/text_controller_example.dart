import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextControllerExample extends HookWidget {
  const TextControllerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('');

    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });

      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useState, useEffect and useTextEditingController'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Text('You typed ${text.value}'),
        ],
      ),
    );
  }
}
