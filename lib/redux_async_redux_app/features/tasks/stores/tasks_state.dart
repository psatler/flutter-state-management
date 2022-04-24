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
}
