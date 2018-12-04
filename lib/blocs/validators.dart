import 'dart:async';

class Validators {
  // Assign instance variables
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    // Handle incoming email data
    handleData: (email, sink) {
      // Validate email data
      if(email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email.');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      // Validate if password is at least 4 characters
      if (password.length > 3) {
        sink.add(password);
      } else {
        sink.addError('Password must be at least 4 characters.');
      }
    }
  );
}