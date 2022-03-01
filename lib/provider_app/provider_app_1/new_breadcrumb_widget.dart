import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'breadcrumb.dart';

class NewBreadCrumbWidget extends StatefulWidget {
  const NewBreadCrumbWidget({Key? key}) : super(key: key);

  @override
  _NewBreadCrumbWidgetState createState() => _NewBreadCrumbWidgetState();
}

class _NewBreadCrumbWidgetState extends State<NewBreadCrumbWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add new bread crumb')),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
                hintText: 'Enter a new bread crumb here...'),
          ),
          TextButton(
            onPressed: () {
              final text = _controller.text;
              if (text.isNotEmpty) {
                final breadCrumb = Breadcrumb(
                  isActive: false,
                  name: text,
                );
                context.read<BreadcrumbProvider>().add(breadCrumb);

                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
