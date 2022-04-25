import 'dart:async';
import 'dart:math';

import 'package:async_redux/async_redux.dart';

import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

import '../../../core/stores/app_state.dart';
import '../../../core/stores/base_action.dart';

class GetTodosAction extends BaseAction {
  GetTodosAction();

  @override
  void before() {
    dispatch(WaitAction.add(TasksState.IS_LOADING, ref: 0));
  }

  @override
  void after() => dispatch(WaitAction.remove(TasksState.IS_LOADING, ref: 0));

  @override
  Future<AppState> reduce() async {
    List<TasksModel> taskList = await env.httpService.get('posts');

    TasksState tasksState = TasksState(tasks: taskList);

    return state.copyWith(tasksState: tasksState);
  }
}

class AddTasksAction extends BaseAction {
  final String title;
  final String body;

  AddTasksAction({
    required this.title,
    required this.body,
  });

  @override
  AppState reduce() {
    final int taskId = Random().nextInt(10000);

    final taskModel = TasksModel(
      id: taskId,
      title: title,
      body: body,
      userId: 1,
    );

    List<TasksModel> currentTaskList = state.tasksState.tasks;
    currentTaskList.insert(0, taskModel);

    print(currentTaskList[0]);
    print(currentTaskList[1]);

    return state.copyWith(
      tasksState: TasksState(
        tasks: currentTaskList,
      ),
    );
  }
}
