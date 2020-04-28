import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//About Tab in the drawer

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: <Widget>[
          Image.asset(''),
          Divider(),
          Flexible(
            child: Text(
                '"Sustainable Fashion" is an Online rental app which was built by the team of Developer Student Club of Management Development Institute of Singapore. The reason of making this application is to provide all of the community needs in fashions by providing short term rent. Feedbacks are appreciated as it would encourage us to improve our application.'),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              _launchURL1();
            },
            child: ListTile(
              title: Text('for more information you can contact'),
              leading: Icon(
                Icons.link,
                color: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL1() async {
  const url = '';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
