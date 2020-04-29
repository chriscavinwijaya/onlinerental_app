import 'package:SustainableFashion/models/user.dart';
import 'package:SustainableFashion/services/Database.dart';
import 'constant.dart';
import 'loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySettings extends StatefulWidget {
  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currentEmail;


  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update Settings.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Enter Your Name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    initialValue: userData.email,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Enter Your Email' : null,
                    onChanged: (val) => setState(() => _currentEmail = val),
                  ),

                  RaisedButton(
                      color: Colors.greenAccent,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentEmail ?? snapshot.data.email,
                              _currentName ?? snapshot.data.name,
                          );
                          Navigator.pop(context);
                        }
                      }
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        }
    );
  }
