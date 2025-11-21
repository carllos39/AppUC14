import 'dart:io';

enum AuthMode { singnup, login }

class AuthFormData {
  String nome = '';
  String email = '';
  String senha = '';
  File? image;

  AuthMode _mode = AuthMode.login;

  bool get isLogin {
    return _mode == AuthMode.login;
  }

  bool get isSignup {
    return _mode == AuthMode.singnup;
  }
  void toggleAuthMode(){
   _mode=isLogin? AuthMode.singnup:AuthMode.login;
  }
}
