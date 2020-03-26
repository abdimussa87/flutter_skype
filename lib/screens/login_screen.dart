import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype/screens/home_screen.dart';
import 'package:skype/services/auth_service.dart';
import 'package:skype/services/database_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _login() async {
    FirebaseUser user = await AuthService.signIn();
    if (user != null) {
      bool exists = await DatabaseService.checkIfCredentialIsWithinDB(user);
      if (exists) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } else {
        await DatabaseService.addUser(user);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FlatButton(
          onPressed: _login,
          child: Text("Login"),
        ),
      ),
    );
  }
}
