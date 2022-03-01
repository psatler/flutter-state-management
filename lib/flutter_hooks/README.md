
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
- 



