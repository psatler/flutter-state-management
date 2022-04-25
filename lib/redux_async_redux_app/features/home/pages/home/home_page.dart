import 'package:flutter/material.dart';
import 'package:flutter_state_management/redux_async_redux_app/app.dart';

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

// https://medium.flutterdevs.com/routeaware-in-flutter-8d26faff05e2
class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void initState() {
    super.initState();

    widget.onFetchTasks();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      RouteNavObserver.instance.routeObserver
          .subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  void dispose() {
    RouteNavObserver.instance.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // a more robust but complex way to rebuild the page when we this page get focused on again

    print('back to this page');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('widget.isLoadingTasks ${widget.isLoadingTasks}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Redux example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, AddTaskPage.routeName);
          // setState(() {}); // check didPopNext override above for another way of updating the screen when we get back from adding the new task
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
