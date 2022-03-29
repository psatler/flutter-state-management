import 'actions.dart';
import 'app_state.dart';

State reducer(State oldState, action) {
  if (action is LoadPeopleAction) {
    return const State(
      isLoading: true,
      error: null,
      fetchedPersons: null,
    );
  }

  if (action is SuccesfullyFetchedPeopleAction) {
    return State(
      isLoading: false,
      error: null,
      fetchedPersons: action.persons,
    );
  }

  if (action is FailedToFetchPeopleAction) {
    return State(
      isLoading: false,
      error: action.error,
      fetchedPersons: oldState.fetchedPersons,
    );
  }

  return oldState;
}
