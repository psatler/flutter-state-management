import 'package:flutter/material.dart';
import 'package:flutter_state_management/bloc/example_1_cubit/bloc_example_1.dart';

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
      body: const BlocExample1(),
    );
  }
}
