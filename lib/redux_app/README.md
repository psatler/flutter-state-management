# Redux

Redux is a third party package that you can bring into your Flutter applications using which you can separate your app's state management into 4 separate layers

1. actions: these are actions that either the user or your application itself triggers in order to change the state of the app.

2. reducers: these are pure functions that take the application's old state and also an action that was performed, and are expected to produce a new state. They don't perform any side effects

3. state: the application's current state

4. middleware: these are functions that can perform side-effects and affect the application's state by intercepting actions.