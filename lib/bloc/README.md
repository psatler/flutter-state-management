> Flutter Bloc State Management


# Blocs example folder strucuture

- [Simple Cubit example](lib/bloc/example_1_cubit/bloc_example_1.dart)
- [Bloc example 1](lib/bloc/example_2_bloc/bloc_example_2.dart)
  - Testing of this can be found [here](test/bloc/example_2_bloc/bloc/persons_bloc_test.dart)
  - An example of enhanced enum
    ```dart
    enum PersonUrl {
      person1('person1'),
      person2('person2');

      final String name;
      const PersonUrl(this.name);

      String get urlString {
        switch (this) {
          case PersonUrl.person1:
            return 'https://mocki.io/v1/94cf5c4d-cc1e-4cf7-b954-c76dd9472020';
          case PersonUrl.person2:
            return 'https://mocki.io/v1/05bbe37d-937e-425e-b383-6e3f0de60095';
        }
      }
    }
    ```
- [Bloc example 2](lib/bloc/example_3_bloc_notes_app/bloc_example_3_notes_app.dart)
  - this one is using flutter_hooks to make it easier to create TextEditingControllers
  - Equality for app state is important for tests
- [Bloc example 3](lib/bloc/example_4_multi_bloc_provider/example_4_multi_bloc_provider.dart) with Multiprovider


# Bloc

- BlocBuilder
  - buildWhen: only rebuilds UI when condition evaluates to true

# Dependencies

```bash
flutter pub add bloc
flutter pub add flutter_bloc

# for testing
flutter pub add --dev bloc_test
```

### Pods issues

```bash
cd ios

# to remote all dependencies from the iOS application
pod deintegrate 

pod install --repo-update
```

Rebuilding the project

```bash
flutter clean
pod install
flutter pub get
flutter run
```

# Firebase rules

## Storage
- Allow user to modify anything inside _userId_ folder
```js
rules_version = '2';
service firebase.storage = {
  match /b/{bucket}/o {

    function isFolderOwner(userId) {
      // making sure the user is authenticated and matches the id
      return request.auth != null && request.auth.uid == userId;
    }

    match /{userId}/{allPaths=**}
      allow create, read, update, write: if isFolderOwner(userId); 
      // allow read, write: if false; 
  }
}
```

## Bloc and Firebase

- [Managing auth errors](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/auth/auth_error.dart)
  - this implements a base error class and the messages and error will be displayed in a dialog to the user
  - all the firebase auth errors can be found [here](https://firebase.google.com/docs/auth/admin/errors)


- Usually start with the events that are going to be sent, then the state and finally, the bloc
  - [events](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/bloc/app_event.dart)
  - [state](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/bloc/app_state.dart)
  - app [bloc](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/bloc/app_bloc.dart)
    - handling event for [image upload](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/bloc/app_bloc.dart#L212)
  - the general dialog used can be found [here](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/dialogs/generic_dialog.dart)
    - this is the base for the other dialogs, such as [delete account dialog](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/dialogs/delete_account_dialog.dart), [logout dialoag](https://github.com/vandadnp/youtube-course-bloc/blob/main/lib/dialogs/logout_dialog.dart), and so on.
  -

# Testing files

The testing files are at [test/bloc/example_2_bloc](test/bloc/example_2_bloc).

To run tests, do

```
flutter test
```
