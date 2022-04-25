# [Async Redux](https://pub.dev/packages/async_redux) package


An official example can be found [here](https://github.com/marcglasberg/redux_app_example)

## Remote Dev Server

```
cd redux-remote-dev-server
yarn 

yarn start

flutter run (or F5)
```

## Some concepts of this package

- For both sync and async reducers, returning a new state is optional. [You may return null](https://pub.dev/packages/async_redux#changing-state-is-optional), which is the same as returning the state unchanged.
- [Before and after the reducer](https://pub.dev/packages/async_redux#before-and-after-the-reducer)
  - using a[n abstract class action](https://pub.dev/packages/async_redux#abstract-before-and-after) to call `before` and `after` 
- [Connector](https://pub.dev/packages/async_redux#connector): getting state info and passing them to the screen components
  - For the view-model comparison to work, your ViewModel class must implement equals/hashcode
  - Just add all the fields you want (which are not callbacks) to the equals parameter to the ViewModel's build constructor.
  ```dart
  ViewModel({
    required this.field1,
    required this.field2,
  }) : super(equals: [field1, field2]);
  ```
- We can process errors thrown by actions using the [ErrorObserver](https://pub.dev/packages/async_redux#processing-errors-thrown-by-actions)
  - we can get more information from the errors by [overriding `wrapError(error)` in the action ](https://pub.dev/packages/async_redux#giving-better-error-messages)
  - we can also use the built-in package's dialog [to display an error to the user](https://pub.dev/packages/async_redux#user-exceptions)
- We can leverage the use of [Wait](https://pub.dev/packages/async_redux#progress-indicators) to display progress indicators
- The store has a [`waitCondition`](https://pub.dev/packages/async_redux#waiting-until-the-state-meets-a-certain-condition) method which we can use to wait for the store state meets a certain condition
- [Persisting the state locally](https://pub.dev/packages/async_redux#persistence)
- [Logging](https://pub.dev/packages/async_redux#logging) action and state
  - there is the [`ConsoleActionObserver`](https://pub.dev/packages/async_redux#printing-actions-to-the-console) which prints the actions to the console
  ```dart
  var store = Store<AppState>(
    initialState: state,
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
    stateObservers: [StateLogger()],
  );

      ...
      ...
  store = Store<AppState>(
    ...
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver()],
  );
  ```
  - We can observe rebuilds with the [modelObserver](https://pub.dev/packages/async_redux#observing-rebuilds)
- Example on how to [interact with a database or some external service](https://pub.dev/packages/async_redux#how-to-interact-with-the-database) by using an async action and abstracting the service with a DAO
  - Another way of interacting with external services would be using a DI, such as explained [at the package's issues](https://github.com/marcglasberg/async_redux/issues/107#issuecomment-863830998) and also the [at the docs as a form of Dependency Injection](https://pub.dev/packages/async_redux#dependency-injection)

# Related content for this example

## List of APIs for frontend test

- List can be found [here](https://dev.to/aumayeung/free-and-fake-apis-you-can-use-to-practice-front-end-development-4eck)
- [Pokemon API](https://pokeapi.co/)
- [JSON Placeholder](https://jsonplaceholder.typicode.com/)

## Modular folder structure

- [Pt-BR Link](https://www.youtube.com/watch?v=67VhBLg89Xk&t=379s&ab_channel=Flutterando)
- [By-feature structure](https://codewithandrea.com/articles/flutter-project-structure/)

- [Old Redux structure](https://github.com/psatler/reactjs-redux-sagas/tree/master/src/store/modules/cart)
