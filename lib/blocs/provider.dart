import 'package:flutter/material.dart';
import './bloc.dart';

// Whenever InheritedWidget is extended, 'updateShouldNotify' is required
// Define Provider's construction function and pass to base class of InheritedWidget
class Provider extends InheritedWidget {

  // Create instance of Bloc
  final bloc = Bloc();

  // Define two named args
  Provider({Key key, Widget child})
    // Pass args to InheritedWidget
    : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  // Static: Not necessary to create an instance of Bloc to provide access to the function
  // 'of' links Bloc to Context
  static Bloc of(BuildContext context) {
    // Look higher in the build heirarchy that looks like Provider, 'as' helps Dart understand the value that comes back.
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}