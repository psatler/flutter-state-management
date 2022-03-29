import 'actions.dart';
import 'app_state.dart';

State reducer(State oldState, action) {
  if (action is SuccessfullyLoadedPersonImageAction) {
    final person = oldState.fetchedPersons
        ?.firstWhere((element) => element.id == action.personId);

    if (person != null) {
      return State(
        error: oldState.error,
        isLoading: false,
        fetchedPersons: oldState.fetchedPersons
            ?.where((element) => element.id != person.id)
            .followedBy([person.copiedWith(false, action.imageData)]),
      );
    }

    return oldState;
  }

  if (action is LoadPersonImageAction) {
    final person = oldState.fetchedPersons
        ?.firstWhere((element) => element.id == action.personId);

    if (person != null) {
      return State(
        error: oldState.error,
        isLoading: false,
        fetchedPersons: oldState.fetchedPersons
            ?.where((element) => element.id != person.id)
            .followedBy([person.copiedWith(true)]),
      );
    }

    return oldState;
  }

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
