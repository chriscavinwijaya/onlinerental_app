import 'package:flutter/material.dart';
import 'Auth.dart';

class Mylogin extends StatefulWidget {
  @override
  _MyloginState createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[120],
      appBar: AppBar(
        backgroundColor: Colors.pink[460],
        elevation: 0.0,
        title: Text('Log In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 70.0),
        child: RaisedButton(
            child: Text('Log In Anon'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('error log in');
              } else {
                print('loged in');
                print(result.uid);
              }
            }),
      ),
    );
  }
}
