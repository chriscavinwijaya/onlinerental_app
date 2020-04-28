import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:SustainableFashion/userscreens/Home/search.dart';
import 'package:SustainableFashion/userscreens/Home/messages.dart';

class ProductDetail extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_price;

  ProductDetail({
    this.product_detail_name,
    this.product_detail_picture,
    this.product_detail_price,
  });
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.greenAccent,
          title: new Text("Sustainable Fashion"),
          centerTitle: false,
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      new CupertinoPageRoute(builder: (BuildContext context) {
                    return new MySearch();
                  }));
                })
          ]),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 290.0,
            child: GridTile(
              child: Container(
                color: Colors.white60,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: ListTile(
                    leading: new Text(
                      widget.product_detail_name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(
                            "\$${widget.product_detail_price}",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Item Buttons//
          Row(
            children: <Widget>[
              //Button #1
              Expanded(
                child: MaterialButton(
                  height: 50,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "Size",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //Button #2
              Expanded(
                child: MaterialButton(
                  height: 50,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "Color",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //Button #3
              Expanded(
                child: MaterialButton(
                  height: 50,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "Qty",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Chat Button
          Row(
            children: <Widget>[
              //Button #1
              Expanded(
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    Navigator.of(context).push(
                        new CupertinoPageRoute(builder: (BuildContext context) {
                      return new MyMessages();
                    }));
                  },
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  child: new Text(
                    "Chat Now",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),

              new IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.redAccent,
                ),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
