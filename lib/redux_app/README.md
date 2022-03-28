# Redux 

- The redux package: https://pub.dev/packages/redux
- Flutter redux bindings: https://pub.dev/packages/flutter_redux

ps.: in this example we are using [Flutter Hooks](https://pub.dev/packages/flutter_hooks) for building the TextEditingController



## States

- it's important to mark the states classes as `@immutable` (from the package meta) to indicate not only to yourself but to whoever is consuming the state that when you get the state nothing inside it is going to change. It's constant, so it is an immutable class instance, and in other words, you won't need to worry about side effects changing the state while you are consuming it.


## Actions

- It is good programming practice to have an abstract class that encircles all your other actions, so the you're redux action will come from the same "category".

`@immutable abstract class Action`


## Reducers

```dart
ItemFilter itemFilterReducer(State oldState, Action action)
```