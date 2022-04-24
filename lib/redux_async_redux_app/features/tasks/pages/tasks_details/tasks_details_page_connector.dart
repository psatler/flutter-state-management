import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_state_management/redux_async_redux_app/core/stores/app_state.dart';
import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

class TasksDetailsViewModel extends Vm {
  final TasksModel task;

  TasksDetailsViewModel({
    required this.task,
  }) : super(equals: [task]);
}

// a more complete example can be found at lib/redux_async_redux_app/features/home/pages/home/home_page_connector.dart
class TasksDetailsFactory
    extends VmFactory<AppState, TasksDetailsPageConnector> {
  // https://github1s.com/marcglasberg/redux_app_example/blob/HEAD/lib/client/screens_and_widgets/trivia_controls_CONNECTOR.dart
  // https://pub.dev/packages/async_redux#connector

  final int taskId;

  TasksDetailsFactory({
    required this.taskId,
  });

  @override
  TasksDetailsViewModel fromStore() {
    return TasksDetailsViewModel(
      task: state.tasksState.tasks.firstWhere((item) => item.id == taskId),
    );
  }
}

class TasksDetailsPageConnector extends StatelessWidget {
  const TasksDetailsPageConnector({
    Key? key,
    required this.taskId,
  }) : super(key: key);

  final int taskId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      vm: () => TasksDetailsFactory(taskId: taskId),
      builder: (context, TasksDetailsViewModel vm) {
        return TasksDetailsPage(task: vm.task);
      },
    );
  }
}
