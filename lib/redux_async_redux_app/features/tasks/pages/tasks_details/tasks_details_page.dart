import 'package:flutter/material.dart';

import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

class TasksDetailsPage extends StatelessWidget {
  static const routeName = '/task_details';

  const TasksDetailsPage({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TasksModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('User id:'),
              Text(task.userId.toString()),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task id: ${task.id}',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            Text(
              'This is the title of the task:',
              style: Theme.of(context).textTheme.headline6,
            ),
            // const SizedBox(height: 15),
            Text(task.title),
            const SizedBox(height: 20),
            Text(
              'This is the body of the task:',
              style: Theme.of(context).textTheme.headline6,
            ),
            // const SizedBox(height: 15),
            Text(task.body)
          ],
        ),
      ),
    );
  }
}
