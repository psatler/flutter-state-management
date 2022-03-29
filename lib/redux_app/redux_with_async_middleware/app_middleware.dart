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
