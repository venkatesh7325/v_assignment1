import 'dart:async';

class Validators {
  // Here we are creating transfermor to validate fields and sending to bloc class
  // fromHandlers - It can handle the data
  // handleData ->Call back with 2 parms one is - User inputing value, sink - we can add the DATA or ERROR
  //Here email and sink are string types.
  var emailValidtor =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      // Valid block
      sink.add(email);
    } else {
      //Error block
      sink.addError("Enter valid email id");
    }
  });
  var mobileValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobile, sink) {
    if (mobile.length == 10) {
      sink.add(mobile);
    } else {
      sink.addError("Enter valid mobile number");
    }
  });
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("Password length should be greater than 4 chars.");
    }
  });
}
