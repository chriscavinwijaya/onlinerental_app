import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../../services/Auth.dart';
import '../../shared/loading.dart';
import '../../shared/constant.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Container(
                  height: 700,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: WaveWidget(
                      config: CustomConfig(
                        gradients: [
                          [Colors.greenAccent, Colors.cyanAccent],
                          [Colors.greenAccent, Colors.cyanAccent],
                        ],
                        durations: [17500, 12000],
                        heightPercentages: [0.15, 0.25],
                        blur: MaskFilter.blur(BlurStyle.solid, 20),
                        gradientBegin: Alignment.bottomCenter,
                        gradientEnd: Alignment.topCenter,
                      ),
                      waveAmplitude: 3,
                      size: Size(
                        double.infinity,
                        double.infinity,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 35.0, horizontal: 35.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/SF_Logo.png',
                              height: 180,
                            ),
                          ),

                          Container(
                            height: 10,
                          ),

                          //Email
                          SizedBox(height: 20),
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter a password with minimum of 6 characters'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),

                          // Register Button
                          SizedBox(
                            height: 50,
                          ),
                          ButtonTheme(
                            minWidth: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              splashColor: Colors.cyanAccent,
                              animationDuration: Duration(seconds: 4),
                              color: Colors.white,
                              child: ListTile(
                                title: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 25,
                                      fontFamily: 'Pacifico'),
                                ),
                                leading: Icon(Icons.email),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(
                                      () {
                                        error =
                                            'Could not Register with those credentials';
                                        loading = false;
                                      },
                                    );
                                  }
                                }
                              },
                            ),
                          ),

                          // Sign In Button
                          SizedBox(
                            height: 25,
                          ),
                          ButtonTheme(
                            minWidth: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              splashColor: Colors.tealAccent,
                              animationDuration: Duration(seconds: 4),
                              color: Colors.greenAccent,
                              child: ListTile(
                                title: Text(
                                  "Sign In Here",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontFamily: 'Pacifico'),
                                ),
                                leading: Icon(Icons.open_in_new),
                              ),
                              onPressed: () {
                                widget.toggleView();
                              },
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            error,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
