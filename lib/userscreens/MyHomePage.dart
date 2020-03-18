import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'search.dart';
import 'messages.dart';
import 'login.dart';
import 'renthistory.dart';
import 'settings.dart';
import 'about.dart';
import 'notifications.dart';
import 'myaccount.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'categories.dart';
import 'products.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage('images/manformalpose.jpg'),
          AssetImage('images/femaleformalpose.jpg'),
          AssetImage('images/dresspose.jpg'),
          AssetImage('images/stageclothespose.jpg'),
          AssetImage('images/guitar.jpg'),
        ],
        autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    this.context = context;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FasHits Online Rental"),
        centerTitle: true,
        actions: <Widget>[
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
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        new CupertinoPageRoute(builder: (BuildContext context) {
                      return new MyMessages();
                    }));
                  }),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                child: new Text(
                  "0",
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              )
            ],
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          image_carousel,
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
          new Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                'Recent products',
                style:
                    new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),

      // Floating Camera Button

//      floatingActionButton: new Stack(
//        children: <Widget>[
//          new FloatingActionButton(
//            onPressed: null,
//            child: Center (
//             child: new Icon( Icons.add_a_photo),
//            ),
//          ),
//        ],
//      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: null,
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
                child: new Icon(Icons.person),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
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
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: new Text("login"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new Mylogin()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
