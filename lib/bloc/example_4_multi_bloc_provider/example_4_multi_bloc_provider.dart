import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/bloc/bottom_bloc.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/bloc/top_bloc.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/models/constants.dart';
import 'package:flutter_state_management/bloc/example_4_multi_bloc_provider/view/app_bloc_view.dart';

class Example4MultiBlocProvider extends StatelessWidget {
  const Example4MultiBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TopBloc>(
            create: (context) => TopBloc(
              urls: images,
              waitBeforeLoading: const Duration(seconds: 3),
            ),
          ),
          BlocProvider<BottomBloc>(
            create: (context) => BottomBloc(
              urls: images,
              waitBeforeLoading: const Duration(milliseconds: 1500),
            ),
          ),
        ],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            AppBlocView<TopBloc>(),
            AppBlocView<BottomBloc>(),
          ],
        ),
      ),
    );
  }
}
