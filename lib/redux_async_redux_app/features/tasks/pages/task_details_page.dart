import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);

  static const routeName = '/task_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
    );
  }
}
