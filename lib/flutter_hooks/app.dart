import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (computationCount) => DateTime.now().toIso8601String(),
    );

class MyFlutterHookApp extends StatelessWidget {
  const MyFlutterHookApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextControllerExample(),
    );
  }
}

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
      appBar: AppBar(title: const Text('Flutter Hooks example')),
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
