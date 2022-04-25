import 'package:flutter/material.dart';
import 'package:flutter_state_management/redux_async_redux_app/features/home/home.dart';
import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

routes(BuildContext context) => {
      HomePage.routeName: (context) => const HomePageConnector(),
      AddTaskPage.routeName: (context) => const AddTaskPageConnector(),
      TasksDetailsPage.routeName: (context) {
        final args = ModalRoute.of(context)!.settings.arguments
            as TasksDetailsPageArguments;

        return TasksDetailsPageConnector(taskId: args.taskId);
      },
    };
