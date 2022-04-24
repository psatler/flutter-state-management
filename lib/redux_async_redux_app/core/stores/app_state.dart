import 'dart:convert';

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

  AppState copyWith({
    HomeState? homeState,
    TasksState? tasksState,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
      tasksState: tasksState ?? this.tasksState,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'homeState': homeState.toMap(),
  //     'tasksState': tasksState.toMap(),
  //   };
  // }

  // factory AppState.fromMap(Map<String, dynamic> map) {
  //   return AppState(
  //     homeState: HomeState.fromMap(map['homeState']),
  //     tasksState: TasksState.fromMap(map['tasksState']),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory AppState.fromJson(String source) => AppState.fromMap(json.decode(source));

  // @override
  // String toString() => 'AppState(homeState: $homeState, tasksState: $tasksState)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.homeState == homeState &&
        other.tasksState == tasksState;
  }

  @override
  int get hashCode => homeState.hashCode ^ tasksState.hashCode;
}
