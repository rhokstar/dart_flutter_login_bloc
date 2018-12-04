import 'dart:async';
import 'validators.dart';

// Rx Dart to combine streams
import 'package:rxdart/rxdart.dart';

// Use 'with' to make use of Validators
// Object class is the base class of all classes
class Bloc extends Object with Validators {
  // Two stream controllers

  // '<>' is generic class
  // Sinks created by StreamController stay open until they're closed or cleaned up, 
  // 'broadcast' makes a stream 'multiple-subscriptions' enabled vs default behavior of 'single-subscription'.
  // Three are listening: 2 StreamBuilders and one Observable (RxDart)
  // final _email = StreamController<String>.broadcast();
  // final _password = StreamController<String>.broadcast();

  // Replaced StreamControllers with BehaviorSubject (RxDart). They are broadcast on default although not a 1:1 replacement. BehaviorSubject has specific functionality for this use case.
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Getters
  // Add data to stream
  // Integrate mixins
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword); 

  //This stream is required for submitButton. Combine two streams and combine values and they need to return double 'true', thus type 'bool'. 'e' and 'p' don't need to be combined but need to be notated.
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  // Change data 
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Anytime a user submits a form, get data to do something like pass to API
  // BehaviorSubject allows extraction of value from streams
  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('$validEmail and $validPassword');
  }

  // Clean up the StreamControllers by using dispose.
  dispose() {
    _email.close();
    _password.close();
  }
}

// This is used in globally defined bloc
// final bloc = Bloc();