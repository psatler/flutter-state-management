import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/bloc/example_3_bloc_notes_app/src/models.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

class LoginApi implements LoginApiProtocol {
  // making it a singleton
  const LoginApi._sharedInstance();
  static const LoginApi _shared = LoginApi._sharedInstance();
  factory LoginApi.instance() => _shared;

  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) async {
    final isLoggedIn = await Future.delayed(
      const Duration(seconds: 2),
      () => email == 'foo@bar.com' && password == 'foobar',
    );

    return isLoggedIn ? const LoginHandle.foobar() : null;
  }
}
