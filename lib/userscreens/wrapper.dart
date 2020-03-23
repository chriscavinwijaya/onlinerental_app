import 'package:flutter/material.dart';
import 'package:onlinerentalapp/userscreens/MyHomePage.dart';
import 'package:provider/provider.dart';
import 'Authenticate.dart';
import 'user.dart';

//returns either home or Authenticate

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    if(user==null){
      return Authenticate();
    }else{
      return MyHomePage();
    }
  }
}