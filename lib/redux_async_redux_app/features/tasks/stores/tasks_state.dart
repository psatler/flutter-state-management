import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../model/model.dart';

@immutable
class TasksState {
  static const IS_LOADING = 'tasks-loading';

  final List<TasksModel> tasks;

  const TasksState({
    required this.tasks,
  });

  const TasksState.initialState() : tasks = const [];

  TasksState copyWith({
    List<TasksModel>? tasks,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  // factory TasksState.fromMap(Map<String, dynamic> map) {
  //   return TasksState(
  //     tasks: List<TasksModel>.from(map['tasks']?.map((x) => TasksModel.fromMap(x))),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory TasksState.fromJson(String source) => TasksState.fromMap(json.decode(source));

  // @override
  // String toString() => 'TasksState(tasks: $tasks)';

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is TasksState &&
  //     listEquals(other.tasks, tasks);
  // }

  // @override
  // int get hashCode => tasks.hashCode;
}
