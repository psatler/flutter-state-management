import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'breadcrumb.dart';
import 'breadcrumb_widget.dart';
import 'new_breadcrumb_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BreadcrumbProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          '/new': (context) => const NewBreadCrumbWidget(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Column(children: [
        Consumer<BreadcrumbProvider>(
          builder: (context, value, child) {
            return BreadCrumbsWidget(
              breadCrumbs: value.items,
              onTapped: (Breadcrumb breadcrumb) {
                print('Breadcrumb clicked was');
                print(breadcrumb.toString());
              },
            );
          },
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/new');
          },
          child: const Text('Add a new bread crumb'),
        ),
        TextButton(
          onPressed: () {
            context.read<BreadcrumbProvider>().reset();
          },
          child: const Text('Reset'),
        ),
      ]),
    );
  }
}
