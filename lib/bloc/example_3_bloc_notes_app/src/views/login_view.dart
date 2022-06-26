import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/views/email_text_field.dart';

import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/views/login_button.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/views/password_text_field.dart';

class LoginView extends HookWidget {
  const LoginView({
    super.key,
    required this.onLoginTapped,
  });

  final OnLoginTapped onLoginTapped;

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          EmailTextField(emailController: emailController),
          PasswordTextField(passwordController: passwordController),
          LoginButton(
            emailController: emailController,
            passwordController: passwordController,
            onLoginTapped: onLoginTapped,
          ),
        ],
      ),
    );
  }
}
