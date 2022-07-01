import 'package:flutter/material.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/strings.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: '$enterYourEmailHere - foo@bar.com',
      ),
    );
  }
}
