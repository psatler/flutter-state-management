import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extensions/random_element_iterator.dart';

const names = [
  'Foo',
  'Bar',
  'Baz',
];

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
}

class BlocExample1 extends StatefulWidget {
  const BlocExample1({Key? key}) : super(key: key);

  @override
  State<BlocExample1> createState() => _BlocExample1State();
}

class _BlocExample1State extends State<BlocExample1> {
  late final NamesCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = NamesCubit();
  }

  @override
  void dispose() {
    cubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: cubit.stream,
      builder: (context, snapshot) {
        final button = TextButton(
          onPressed: () => cubit.pickRandomName(),
          child: const Text('Pick name'),
        );

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return button;
          case ConnectionState.waiting:
            return button;
          case ConnectionState.active:
            return Column(
              children: [
                Text(snapshot.data ?? ''),
                button,
              ],
            );
          case ConnectionState.done:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
