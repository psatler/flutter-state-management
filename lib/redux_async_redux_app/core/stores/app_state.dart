import 'package:async_redux/async_redux.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../features/home/home.dart';
import '../../features/tasks/tasks.dart';

@immutable
class AppState extends Equatable {
  final Wait wait; // https://pub.dev/packages/async_redux#progress-indicators
  final HomeState homeState;
  final TasksState tasksState;

  const AppState({
    required this.wait,
    required this.homeState,
    required this.tasksState,
  });

  const AppState.initialState()
      : homeState = const HomeState.initialState(),
        tasksState = const TasksState.initialState(),
        wait = Wait.empty;

  AppState copyWith({
    Wait? wait,
    HomeState? homeState,
    TasksState? tasksState,
  }) {
    return AppState(
      wait: wait ?? this.wait,
      homeState: homeState ?? this.homeState,
      tasksState: tasksState ?? this.tasksState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'wait': wait.toMap(),
      // 'homeState': homeState.toMap(),
      'tasksState': tasksState.toMap(),
    };
  }

  // factory AppState.fromMap(Map<String, dynamic> map) {
  //   return AppState(
  //     wait: Wait.fromMap(map['wait']),
  //     homeState: HomeState.fromMap(map['homeState']),
  //     tasksState: TasksState.fromMap(map['tasksState']),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory AppState.fromJson(String source) => AppState.fromMap(json.decode(source));

  @override
  List<Object?> get props => [wait, homeState, tasksState];

  @override
  bool? get stringify => true;
}
