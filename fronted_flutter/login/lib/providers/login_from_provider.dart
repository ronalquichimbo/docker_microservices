import 'package:flutter/material.dart';
// import 'package:login/models/users.dart';
// import 'package:http/http.dart' as http;

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formkey.currentState?.validate());
    print('$email $password');
    return formkey.currentState?.validate() ?? false;
  }
}
