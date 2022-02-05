import 'package:flutter/material.dart';
import 'package:picture_note/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:picture_note/screens/home.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _authenticationWarapper(context);
  }

  _authenticationWarapper(BuildContext context) {
    final user = context.watch<User?>();

    if (user != null) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
