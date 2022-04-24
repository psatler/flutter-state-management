import 'package:flutter/material.dart';

import 'package:flutter_state_management/redux_async_redux_app/features/tasks/model/tasks_model.dart';
import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

import '../../../tasks/pages/add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.tasksList,
    required this.onFetchTasks,
  }) : super(key: key);

  final List<TasksModel> tasksList;
  final VoidCallback onFetchTasks;

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.onFetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Redux example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTaskPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Text('TaskList length: ${widget.tasksList.length}'),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                TasksModel task = widget.tasksList[index];
                Color rowColor = index % 2 == 0 ? Colors.green : Colors.yellow;

                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, TaskDetailsPage.routeName);
                  },
                  title: Text(task.title),
                  subtitle: Text(task.body),
                  leading: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: rowColor,
                    ),
                    child: Text(
                      task.id.toString(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
