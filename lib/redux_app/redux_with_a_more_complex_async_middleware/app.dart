import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'person_model.dart';
import 'app_middleware.dart';
import 'app_reducer.dart';
import 'app_state.dart' as app_state;

class MyReduxAppAsyncMoreComplex extends StatelessWidget {
  const MyReduxAppAsyncMoreComplex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Store(
      reducer,
      initialState: const app_state.State.empty(),
      middleware: [
        loadPeopleMiddleware,
        loadPersonImageMiddleware,
      ],
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Redux More Complex Middleware')),
      body: StoreProvider(
        store: store,
        child: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  store.dispatch(const LoadPeopleAction());
                },
                child: const Text('Load persons'),
              ),
            ),
            StoreConnector<app_state.State, bool>(
              converter: (store) => store.state.isLoading,
              builder: (context, isLoading) {
                if (isLoading) {
                  return const CircularProgressIndicator();
                }

                return const SizedBox();
              },
            ),
            StoreConnector<app_state.State, Iterable<Person>?>(
              converter: (store) => store.state.sortedFetchedPersons,
              builder: (context, people) {
                if (people == null) {
                  return const SizedBox();
                }

                return Expanded(
                    child: ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    final person = people.elementAt(index);
                    final infoWidget = Text('${person.age} years old');

                    final Widget subTitle = person.imageData == null
                        ? infoWidget
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              infoWidget,
                              Image.memory(person.imageData!),
                            ],
                          );

                    final Widget trailing = person.isLoading
                        ? const CircularProgressIndicator()
                        : TextButton(
                            onPressed: () {
                              store.dispatch(
                                LoadPersonImageAction(personId: person.id),
                              );
                            },
                            child: const Text('Load Image'),
                          );

                    return ListTile(
                      title: Text(person.name),
                      subtitle: subTitle,
                      trailing: trailing,
                    );
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
