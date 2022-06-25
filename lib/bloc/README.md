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

# Testing files

The testing files are at [test/bloc/example_2_bloc](test/bloc/example_2_bloc).

To run tests, do

```
flutter test
```
