import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_state_management/redux_async_redux_app/core/stores/app_state.dart';
import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

import 'home_page.dart';

// class HomePageModel extends BaseModel<AppState> {
//   HomePageModel();

//   HomePageModel.build({
//     required this.tasks,
//     required this.onFetchTasks,
//   }) : super(equals: [
//           tasks,
//         ]);

//   late List<TasksModel> tasks;
//   late VoidCallback onFetchTasks;

//   @override
//   BaseModel fromStore() {
//     return HomePageModel.build(
//       tasks: state.tasksState.tasks,
//       onFetchTasks: () => dispatch?.call(GetTodosAction()),
//     );
//   }
// }

// class HomePageConnector extends StatelessWidget {
//   const HomePageConnector({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector(
//       model: HomePageModel(),
//       builder: (context, vm) {
//         return Container();
//       },
//     );
//   }
// }

// ### Newer way to connect to store ###

class HomePageViewModel extends Vm {
  final List<TasksModel> tasks;
  final VoidCallback onFetchTasks;
  final bool isLoadingTasks;

  HomePageViewModel({
    required this.tasks,
    required this.onFetchTasks,
    required this.isLoadingTasks,
  }) : super(equals: [tasks, isLoadingTasks]);
}

class HomePageFactory extends VmFactory<AppState, HomePageConnector> {
  // https://github1s.com/marcglasberg/redux_app_example/blob/HEAD/lib/client/screens_and_widgets/trivia_controls_CONNECTOR.dart
  // https://pub.dev/packages/async_redux#connector

  @override
  HomePageViewModel fromStore() {
    return HomePageViewModel(
      tasks: state.tasksState.tasks,
      onFetchTasks: () => dispatch(GetTodosAction()),
      isLoadingTasks: state.wait.isWaitingFor(TasksState.IS_LOADING, ref: 0),
    );
  }
}

class HomePageConnector extends StatelessWidget {
  const HomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      vm: () => HomePageFactory(),
      builder: (context, HomePageViewModel vm) {
        return HomePage(
          tasksList: vm.tasks,
          onFetchTasks: vm.onFetchTasks,
          isLoadingTasks: vm.isLoadingTasks,
        );
      },
    );
  }
}
