import 'dart:async';

import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

import '../../../core/stores/app_state.dart';
import '../../../core/stores/base_action.dart';

class GetTodosAction extends BaseAction {
  GetTodosAction();

  @override
  Future<AppState> reduce() async {
    List<TasksModel> taskList = await env.httpService.get('posts');

    TasksState tasksState = TasksState(tasks: taskList);

    return state.copyWith(tasksState: tasksState);
  }
}
