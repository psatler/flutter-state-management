import 'package:flutter/material.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/strings.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      // keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      obscuringCharacter: '◉',
      decoration: const InputDecoration(
        hintText: '$enterYourPasswordHere - foobar',
      ),
    );
  }
}
