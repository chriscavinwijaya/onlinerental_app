import 'package:flutter/material.dart';
import 'Auth.dart';

class Mylogout extends StatefulWidget {
  @override
  _MylogoutState createState() => _MylogoutState();
}

class _MylogoutState extends State<Mylogout> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0.0,
        title: Text('Sustainable Fashion'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 35.0),
        child: RaisedButton(
            child: Text('Logout'),
            onPressed: () async {
              dynamic result = await _auth.signOut();
              if (result == null) {
                print('successfully logged out');
              } else {
                print('error logging out');
                print(result.uid);
              }
            }),
      ),
    );
  }
}
