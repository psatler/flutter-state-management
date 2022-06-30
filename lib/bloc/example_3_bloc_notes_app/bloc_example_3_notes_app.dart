import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/bloc/dialogs/generic_dialog.dart';
import 'package:flutter_state_management/bloc/dialogs/loading_screen.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/api/login_api.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/api/notes_api.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/bloc/actions.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/bloc/app_bloc.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/bloc/app_state.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/models.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/strings.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/views/iterable_list_view.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/views/login_view.dart';

class BlocExample3NotesApp extends StatelessWidget {
  const BlocExample3NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        loginApi: LoginApi(),
        notesApi: NotesApi(),
        acceptedLoginHandle: const LoginHandle.foobar(),
      ),
      child: BlocConsumer<AppBloc, AppState>(
        listener: (context, appState) {
          // loading screen
          if (appState.isLoading) {
            LoadingScreen.instance().show(context: context, text: pleaseWait);
          } else {
            LoadingScreen.instance().hide();
          }

          // display possible errors
          final loginError = appState.loginErrors;
          if (loginError != null) {
            showGenericDialog<bool>(
              context: context,
              title: loginErrorDialogTitle,
              content: loginErrorDialogContent,
              optionsBuilder: () => {
                "ok": true,
              },
            );
          }

          // if we are logged in, but we have no fetched notes, fetch them now
          if (appState.isLoading == false &&
              appState.loginErrors == null &&
              appState.loginHandle == const LoginHandle.foobar() &&
              appState.fetchedNotes == null) {
            context.read<AppBloc>().add(const LoadNotesAction());
          }
        },
        builder: (context, AppState appState) {
          final notes = appState.fetchedNotes;
          if (notes == null) {
            return LoginView(
              onLoginTapped: (email, password) {
                context
                    .read<AppBloc>()
                    .add(LoginAction(email: email, password: password));
              },
            );
          }

          return notes.toListView();
        },
      ),
    );
  }
}
