import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinerentalapp/pages/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Bow Tie",
      "picture": "images/bowtie.jpg",
      "price": "5/day",
    },
    {
      "name": "Dress",
      "picture": "images/dressprod.jpg",
      "price": "10/day",
    },
    {
      "name": "Suit",
      "picture": "images/manformal.jpg",
      "price": "20/day",
    },
    {
      "name": "Kimono",
      "picture": "images/traditionaljapan.png",
      "price": "20/day",
    },
    {
      "name": "Leather Shoes",
      "picture": "images/menshoes.png",
      "price": "5/day",
    },
    {
      "name": "Wedding Dress",
      "picture": "images/weedingdress.png",
      "price": "45/day",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (BuildContext context) => new ProductDetail(
                        product_detail_name: prod_name,
                        product_detail_price: prod_price,
                        product_detail_picture: prod_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),

                      //      subtitle:Text(
                      //        "/day",
                      //    style: TextStyle(fontWeight: FontWeight.bold,
                      //      ),
                      //    ),
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
