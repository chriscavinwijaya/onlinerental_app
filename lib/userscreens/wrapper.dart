import 'package:flutter/material.dart';
import 'package:SustainableFashion/userscreens/Home/MyHomePage.dart';
import 'package:provider/provider.dart';
import 'authenticate/Authenticate.dart';
import '../models/user.dart';

//returns either HomePage or Authenticate

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //Return Home or Authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}
