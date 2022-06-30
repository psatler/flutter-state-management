import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/api/login_api.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/api/notes_api.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/bloc/actions.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/bloc/app_state.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/models.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  // passing the service interfaces as parameter instead of concrete classes
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;
  final LoginHandle acceptedLoginHandle;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
    required this.acceptedLoginHandle,
  }) : super(const AppState.empty()) {
    on<LoginAction>((event, emit) async {
      // start loading
      emit(
        const AppState(
          isLoading: true,
          loginErrors: null,
          loginHandle: null,
          fetchedNotes: null,
        ),
      );

      // log the user in
      final loginHandle = await loginApi.login(
        email: event.email,
        password: event.password,
      );

      emit(
        AppState(
          isLoading: false,
          loginErrors: loginHandle == null ? LoginErrors.invalidHandle : null,
          loginHandle: loginHandle,
          fetchedNotes: null,
        ),
      );
    });

    on<LoadNotesAction>((event, emit) async {
      // start loading
      emit(
        AppState(
          isLoading: true,
          loginErrors: null,
          loginHandle: state.loginHandle,
          fetchedNotes: null,
        ),
      );

      final loginHandle = state.loginHandle;
      if (loginHandle != acceptedLoginHandle) {
        // invalid login handle, cannot fetch notes
        emit(
          AppState(
            isLoading: false,
            loginErrors: LoginErrors.invalidHandle,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );

        return;
      }

      // we have a valid login and want to fetch notes
      final notes = await notesApi.getNotes(loginHandle: loginHandle!);
      emit(
        AppState(
          isLoading: false,
          loginErrors: null,
          loginHandle: loginHandle,
          fetchedNotes: notes,
        ),
      );
    });
  }
}
