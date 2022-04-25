import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'add_task.dart';

class AddTaskPage extends HookWidget {
  static const routeName = '/add_task';

  const AddTaskPage({
    Key? key,
    required this.handleCreateNewTask,
  }) : super(key: key);

  final CreateNewTaskCallback handleCreateNewTask;

  @override
  Widget build(BuildContext context) {
    // final focusNode = useFocusNode();
    final titleTextController = useTextEditingController();
    final bodyTextController = useTextEditingController();

    final handleSubmit = useCallback(() {
      handleCreateNewTask(
        title: titleTextController.text,
        body: bodyTextController.text,
      );

      titleTextController.clear();
      bodyTextController.clear();
    }, [handleCreateNewTask, titleTextController, bodyTextController]);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                // focusNode: focusNode,
                controller: titleTextController,
                decoration: const InputDecoration(labelText: 'Task title'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: bodyTextController,
                decoration: const InputDecoration(labelText: 'Task body'),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  print('onEditingComplete');
                  handleSubmit();
                },
                // onSubmitted: (text) {
                //   print('onSubmitted $text');
                // },
                minLines: 3,
                maxLines: null,
                // keyboardType: TextInputType.number,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      titleTextController.clear();
                      bodyTextController.clear();
                    },
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear fields'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      handleSubmit();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Task'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
