import 'package:flutter/services.dart';
import 'package:redux/redux.dart';

import 'api/service.dart';
import 'actions.dart';
import 'app_state.dart';

void loadPeopleMiddleware(Store<State> store, action, NextDispatcher next) {
  if (action is LoadPeopleAction) {
    getPersons().then((persons) {
      store.dispatch(SuccesfullyFetchedPeopleAction(persons: persons));
    }).catchError((err) {
      store.dispatch(FailedToFetchPeopleAction(error: err));
    });
  }

  next(action);
}

void loadPersonImageMiddleware(
    Store<State> store, action, NextDispatcher next) {
  if (action is LoadPersonImageAction) {
    final person = store.state.fetchedPersons
        ?.firstWhere((element) => element.id == action.personId);

    if (person != null) {
      final url = person.imageUrl;
      final bundle = NetworkAssetBundle(Uri.parse(url));
      bundle.load(url).then(
        (byteData) {
          return byteData.buffer.asUint8List();
        },
      ).then((data) {
        store.dispatch(
          SuccessfullyLoadedPersonImageAction(
              personId: person.id, imageData: data),
        );
      });
    }
  }

  next(action);
}
