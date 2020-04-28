import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:SustainableFashion/userscreens/Auth.dart';
import 'search.dart';
import 'messages.dart';
import 'logout.dart';
import 'renthistory.dart';
import 'settings.dart';
import 'about.dart';
import 'notifications.dart';
import 'myaccount.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'categories.dart';
import 'products.dart';
import 'package:responsive_container/responsive_container.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _auth = AuthService();
  final FirebaseAuth _auth1 = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth1.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage('images/manformalpose.jpg'),
          AssetImage('images/femaleformalpose.jpg'),
          AssetImage('images/dresspose.jpg'),
          AssetImage('images/stageclothespose.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.white30,
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent,
        title: new Text("Sustainable Fashion"),
        centerTitle: false,
        actions: <Widget>[
          //Search Button
          new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new MySearch();
                }));
              }),

          //Message Button
          Center(
            child: new Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new CupertinoPageRoute(
                          builder: (BuildContext context) {
                        return new MyMessages();
                      }));
                    }),
                new CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.redAccent,
                  child: new Text(
                    "0",
                    style: new TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),

      //Categories
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            imageCarousel,
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    'Categories',
                    style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
            ),
            Categories(),

            //Recent Products
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  'Recent products',
                  style: new TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ResponsiveContainer(
              heightPercent: 100,
              widthPercent: 100,
              child: Products(),
            )
          ],
        ),
      ),

      // Floating Camera Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: null,
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //

      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Kevin"),
              accountEmail: new Text("Kevin@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(
                  Icons.person,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: new Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: new Text("My Account"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new MyAccount()));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: new Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: new Text("Rent Notifications"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new MyNotifications()));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: new Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: new Text("Rent History"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new MyRentHistory()));
              },
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: new Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: new Text("Settings"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new MySettings()));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: new Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: new Text("About"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new About()));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: new Text("Logout"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new Mylogout()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
