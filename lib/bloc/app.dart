import 'package:flutter/material.dart';
import 'package:flutter_state_management/bloc/example_1_cubit/bloc_example_1.dart';
import 'package:flutter_state_management/bloc/example_2_bloc/bloc_example_2.dart';

import 'example_3_bloc_notes_app/bloc_example_3_notes_app.dart';

class BlocStateManagement extends StatelessWidget {
  const BlocStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BlocHome(),
      // routes: routes(context),
      // onGenerateRoute: ,
    );
  }
}

class BlocHome extends StatelessWidget {
  const BlocHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Cubit example 1'),
          BlocExample1(),
          Text('Bloc example 2'),
          BlocExample2(),
          Text('Bloc example 3'),
          BlocExample3NotesApp(),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
