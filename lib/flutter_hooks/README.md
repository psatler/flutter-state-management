
# [Flutter Hooks](https://pub.dev/packages/flutter_hooks)

- Inspired by the [React Hooks](https://dev.to/dan_abramov/making-sense-of-react-hooks-2eib) counterpart

```
flutter pub add flutter_hooks
```

## Motivations

- in Dart we can have at most 1 super-class
  - that creates a problem when wanting to reuse code

## Hooks in Flutter
- Hooks are a way to increase the ability to share code
- **Hooks can only be used inside the `build()` function of your widgets**, as long as the widget is a _HookWidet_.


### Some hooks used in the example

- useStream
  ```dart
  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());
  ```
- useState, useTextEditingController, useEffect
  ```dart
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
  ```
- useMemoized
  - this allows caching of complex objects
  ```dart
    final future = NetworkAssetBundle(Uri.parse(url()))
        .load(url())
        .then((data) => data.buffer.asUint8List())
        .then((data) => Image.memory(data));

    final imageFuture = useMemoized(() => future); // memoizing a complex obj
    final snapshotImage = useFuture(imageFuture);
  ```
- useListenable [example](lib/flutter_hooks/use_listenable_example.dart)
  - this will help us listen for changes in a ValueNotifier and/or ChangeNotifier
  - in other words, it consumes a listenable and call the `build()` method whenever the listenable value changes
  - we'll have to use _useMemoized_ so that it doesn't create the listenable over and over again when the build happens
    
- [useAnimationController and useScrollController](lib/flutter_hooks/scrolling_example.dart) to create a scrolling animation
  - we had to **normalize** values in this examples. For that, we created an [extension](lib/flutter_hooks/extensions/normalize_extension.dart).
  - 

## Extra

- created an [extension](lib/flutter_hooks/compact_map_extension.dart) to remove nullable values from iterables