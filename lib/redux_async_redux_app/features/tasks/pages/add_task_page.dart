import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  static const routeName = '/add_task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Task name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Task priority'),
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.clear),
                label: const Text('Clear fields'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Task'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
