import 'package:flutter/material.dart';
import 'package:skype/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("HomeScreen"),
            FlatButton(
              onPressed: _logout,
              child:Text("logout"),
            ),
          ],
        ),
      ),
    );
  }

  _logout()async{
    await AuthService.signOut();
  }

}
