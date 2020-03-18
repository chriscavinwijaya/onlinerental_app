import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/manformal.jpg',
            image_caption: 'Male Formal',
          ),
          Category(
            image_location: 'images/weedingdress.png',
            image_caption: 'Dress',
          ),
          Category(
            image_location: 'images/femaleformal.jpeg',
            image_caption: 'Female Formal',
          ),
          Category(
            image_location: 'images/traditionaljapan.png',
            image_caption: 'Costumes',
          ),
          Category(
            image_location: 'images/menshoes.png',
            image_caption: 'Men Shoes',
          ),
          Category(
            image_location: 'images/womenheels.jpg',
            image_caption: 'Women Shoes',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 120.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 100.0,
                height: 90.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: new TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
  }
}
