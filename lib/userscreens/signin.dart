import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';
import 'constant.dart';
import 'loading.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:carousel_pro/carousel_pro.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
//    //Carousel
//    Widget imageCarousel = Container(
//      child: Carousel(
//        boxFit: BoxFit.fitHeight,
//        images: [
//          AssetImage('images/Formalmenclothes.png'),
//          AssetImage('images/blackdress.jpg'),
//        ],
//        autoplay: true,
//        animationCurve: Curves.fastOutSlowIn,
//        animationDuration: Duration(microseconds: 2000),
//        dotSize: 3.0,
//        indicatorBgPadding: 4.0,
////        dotBgColor: Colors.tealAccent,
//      ),
//      height: 150,
//      width: double.infinity,
//    );

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
//Background Wave Container
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

//Container
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 35.0, horizontal: 35.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                          ),

//                          Container(
//                            child: Center(
//                                child: Text(
//                              'FasHits Online Rental',
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: 40,
//                                  fontFamily: 'SF UI Display',
//                                  color: Colors.blue),
//                            )),
//                          ),

                          Container(
                            height: 5.0,
                          ),
//imageCarousel,

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

                          //Password
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

                          // Sign In Button
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
                              color: Colors.greenAccent,
                              child: ListTile(
                                title: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontFamily: 'Pacifico'),
                                ),
                                leading: Icon(Icons.email),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(
                                      () {
                                        error =
                                            'Unable to sign in with those credentials';
                                        loading = false;
                                      },
                                    );
                                  } else {
                                    print('Signed In');
                                    print(result);
                                  }
                                }
                              },
                            ),
                          ),

                          // Register Button
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
                              color: Colors.white,
                              child: ListTile(
                                title: Text(
                                  "Register Here",
                                  style: TextStyle(
                                      color: Colors.greenAccent,
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
