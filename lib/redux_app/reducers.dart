import 'package:redux/redux.dart';

import 'add_remove_extension.dart';
import 'actions.dart';
import 'redux_state.dart';

Iterable<String> addItemReducer(
  Iterable<String> previousItems,
  AddItemAction action,
) =>
    previousItems + action.item;

Iterable<String> removeItemReducer(
  Iterable<String> previousItems,
  RemoveItemAction action,
) =>
    previousItems - action.item;

Reducer<Iterable<String>> itemsReducer = combineReducers<Iterable<String>>(
  [
    TypedReducer<Iterable<String>, AddItemAction>(addItemReducer),
    TypedReducer<Iterable<String>, RemoveItemAction>(removeItemReducer),
  ],
);

// ##################################################################

ItemFilter itemFilterReducer(
  State oldState,
  Action action,
) {
  if (action is ChangeFilterTypeAction) {
    return action.filter;
  }

  return oldState.filter;
}

// ##################################################################

State appStateReducer(State oldState, action) => State(
      items: itemsReducer(oldState.items, action),
      filter: itemFilterReducer(oldState, action),
    );
