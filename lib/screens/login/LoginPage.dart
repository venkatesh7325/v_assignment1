import 'package:flutter/material.dart';
import 'package:virtusa_assignment1/bloc/Provider.dart';
import 'package:virtusa_assignment1/bloc/login_bloc.dart';
import 'package:virtusa_assignment1/screens/home/MyHomePage.dart';
import 'package:virtusa_assignment1/utils/AppColor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _inputEmail(loginBloc),
              buildSizedBox(10.0),
              _inputMobile(loginBloc),
              _inputPassword(loginBloc),
              buildSizedBox(10.0),
              _signInButton(context, loginBloc),
              buildSizedBox(10.0),
              _loadWeatherButton()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double val) {
    return SizedBox(
      height: val,
    );
  }

// Email field..
  Widget _inputEmail(LoginBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.emailChanged,
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecoration('Email', snapshot),
          );
        });
  }

// Mobile field..
  Widget _inputMobile(LoginBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.mobileStream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.mobileChanged,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            decoration: inputDecoration('Mobile number', snapshot),
          );
        });
  }

// Password field..
  Widget _inputPassword(LoginBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.passwordChanged,
            obscureText: true,
            decoration: inputDecoration('Password', snapshot),
          );
        });
  }

// Common Input decoration for input fields
  InputDecoration inputDecoration(String placeHolder, AsyncSnapshot snapshot) {
    return InputDecoration(
      labelText: placeHolder,
      contentPadding: EdgeInsets.all(8),
      errorText: snapshot.error,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _signInButton(BuildContext context, LoginBloc bloc) {
    return Container(
      child: StreamBuilder<bool>(
          stream: bloc.btnCheckStream,
          builder: (context, snapshot) => RaisedButton(
                onPressed:
                    snapshot.hasData ? () => _navigateNextScreen() : null,
                textColor: Colors.white,
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
                color: AppColor.appPrimaryColor,
              )),
    );
  }

  Widget _loadWeatherButton() {
    return Container(
      child: RaisedButton(
        onPressed: () => {_navigateNextScreen()},
        textColor: Colors.white,
        child: Text(
          'Load Weather',
          style: TextStyle(color: Colors.white),
        ),
        color: AppColor.appPrimaryColor,
      ),
    );
  }

// Navigating to next screen.......
  _navigateNextScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
