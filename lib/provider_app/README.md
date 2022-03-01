
# [Provider](https://pub.dev/packages/provider)



- ChangeNotifierProvider creates an instance of a ChangeNotifier and provide it to its descendants

- methods to communicate with providers
  - **read**: usually used when you want to communicate something to the provider. For example, to perform an action. 
    - This is normally used inside callbacks.
    - it uses internally `Provider.of<T>(this, listen: false);` which means that it doesn't listen for changes.
    - Don't ever use `read` if you expect a mutable value to affect your UI.
      ```dart
        context.read<BreadCrumbProvider>().reset();
      ```
  - **select**: _context.select_ allows us to watch specific changes inside of the provider. 
    - when a provider emits an update, all selectors will be called. If the current value is different than the previous returned value, the widget will be marked to be rebuilt. 
    - _select_ is only useful inside the `build()` function of your widgets
    - do not use it inside callbacks 
    - changes to the selected value will mark the widget as needing to be rebuilt. In other words, it only rebuilds your widget if the given aspect of your provider changes
      ```dart
         final title = context.select<Movie?, String>((movie) => movie?.title);
      ```
  - **watch**: for watching any changes in the provider
    - `context.watch` depends on a given provider up the hierarchy
    - it marks the widget to be rebuilt if the provider changes
    - _watch_ is only useful inside the `build()` function of your widgets
    - **`context.watch` also allows you to depend on an optional provider.**
    - also uses `provider.of` where listen is `true` by default.

- Outside of the build function?
  - use `Provider.of<T>` instead

### Consumer
- Consumes a provider and has a builder
- it creates a new widget and calls the builder with its own _BuildContext_.
  - it alsos wrap itself around the returned widget from the builder
- Consumer is useful if the widget returned from builder depends on the provider before the context itself has access to it
- **Child of the Consumer**: Consumer has a child widget that doesn't get rebuilt when the provider changes



