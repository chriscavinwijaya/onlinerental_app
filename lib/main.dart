import 'package:flutter/material.dart';
import 'package:onlinerentalapp/userscreens/Auth.dart';
import 'package:onlinerentalapp/userscreens/user.dart';
import 'package:onlinerentalapp/userscreens/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          // This widget is the root of your application.
          debugShowCheckedModeBanner: false,
          home: Wrapper()),
    );
  }
}
