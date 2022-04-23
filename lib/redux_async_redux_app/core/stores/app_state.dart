import 'package:flutter/foundation.dart';

import '../../features/home/home.dart';
import '../../features/tasks/tasks.dart';

@immutable
class AppState {
  final HomeState homeState;
  final TasksState tasksState;

  const AppState.initialState()
      : homeState = const HomeState.initialState(),
        tasksState = const TasksState.initialState();

  const AppState({
    required this.homeState,
    required this.tasksState,
  });
}
