import 'package:flutter/material.dart';

import 'package:flutter_state_management/redux_async_redux_app/features/tasks/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.tasksList,
    required this.onFetchTasks,
    required this.isLoadingTasks,
  }) : super(key: key);

  final List<TasksModel> tasksList;
  final VoidCallback onFetchTasks;
  final bool isLoadingTasks;

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
    print('widget.isLoadingTasks ${widget.isLoadingTasks}');
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
      body: widget.isLoadingTasks
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text('TaskList length: ${widget.tasksList.length}'),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.tasksList.length,
                    itemBuilder: (context, index) {
                      TasksModel task = widget.tasksList[index];
                      Color rowColor =
                          index % 2 == 0 ? Colors.green : Colors.yellow;

                      int taskId = task.id;

                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            TasksDetailsPage.routeName,
                            arguments: TasksDetailsPageArguments(
                              taskId: taskId,
                            ),
                          );
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
