import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:virtusa_assignment1/screens/Validators.dart';

class LoginBloc extends Object with Validators implements BaseBloc {
  // Make a stream controller to taking inputs.
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _mobileController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

  //Here stream sink to get inputs whenever yoy enter
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get mobileChanged => _mobileController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

// to get valid or invalid inputs we need a stream(its pipe -> there will be a input and output )
  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidtor);
  Stream<String> get mobileStream =>
      _mobileController.stream.transform(mobileValidator);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);

  //Create bool stream to enable and disable login button with obaservale
  Stream<bool> get btnCheckStream => Observable.combineLatest3(
      emailStream,
      mobileStream,
      passwordStream,
      (a, b, c) => true); // If 3 fields have data, it will become true..
  void submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  @override
  void dispose() {
    // here closing controllers
    _emailController.close();
    _mobileController.close();
    _passwordController.close();
  }
}

//To close stream controllers we will create abstarct class with method.
abstract class BaseBloc {
  void dispose();
}
