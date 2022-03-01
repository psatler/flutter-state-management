
# [Provider](https://pub.dev/packages/provider)



- ChangeNotifierProvider creates an instance of a ChangeNotifier and provide it to its descendants

- methods to communite with providers
  - read: usually used when you want to communicate something to the provider. For example, to perform an action. 
    - This is normally used inside callbacks.
    - Don't ever use `read` if you expect a mutable value to affect your UI.
      ```dart
        context.read<BreadCrumbProvider>().reset();
      ```
  - select:
  - watch: 