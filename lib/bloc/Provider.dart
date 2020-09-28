import 'package:flutter/material.dart';
import 'package:virtusa_assignment1/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  final bloc = LoginBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
