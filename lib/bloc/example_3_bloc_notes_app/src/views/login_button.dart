import 'package:flutter/material.dart';
import 'package:flutter_state_management/bloc/dialogs/generic_dialog.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/strings.dart';

typedef OnLoginTapped = void Function(String email, String password);

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginTapped,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLoginTapped onLoginTapped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final email = emailController.text;
        final password = passwordController.text;

        if (email.isEmpty || password.isEmpty) {
          showGenericDialog<bool>(
            context: context,
            title: emailOrPasswordEmptyDialogTitle,
            content: emailOrPasswordEmptyDescription,
            optionsBuilder: () => {
              'ok': true,
            },
          );

          return;
        }

        onLoginTapped(email, password);
      },
      child: const Text(login),
    );
  }
}
