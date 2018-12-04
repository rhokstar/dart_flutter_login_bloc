import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../blocs/provider.dart';

class App extends StatelessWidget {
  build(context) {
    // Make available Bloc inside Provider, which is the child
    return Provider(
      child: MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
