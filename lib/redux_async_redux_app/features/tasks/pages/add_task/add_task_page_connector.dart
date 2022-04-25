import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/redux_async_redux_app/core/stores/app_state.dart';

import '../../tasks.dart';

typedef CreateNewTaskCallback = void Function(
    {required String title, required String body});

class AddTaskPageViewModel extends Vm {
  final CreateNewTaskCallback onCreateNewTask;

  AddTaskPageViewModel({
    required this.onCreateNewTask,
  }) : super(equals: []);
}

class AddTaskPageFactory extends VmFactory<AppState, AddTaskPageConnector> {
  @override
  AddTaskPageViewModel fromStore() {
    return AddTaskPageViewModel(onCreateNewTask: ({
      required String title,
      required String body,
    }) {
      dispatch(AddTasksAction(
        title: title,
        body: body,
      ));
    });
  }
}

// https://github1s.com/marcglasberg/redux_app_example/blob/HEAD/lib/client/screens_and_widgets/trivia_controls_CONNECTOR.dart
// https://pub.dev/packages/async_redux#connector
class AddTaskPageConnector extends StatelessWidget {
  const AddTaskPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      vm: () => AddTaskPageFactory(),
      builder: (context, AddTaskPageViewModel vm) {
        return AddTaskPage(
          handleCreateNewTask: vm.onCreateNewTask,
        );
      },
    );
  }
}
