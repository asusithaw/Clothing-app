import 'package:flutter/material.dart';
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.0 ,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:<Widget>[
            category(
              image_location: 'images/blouse.png',
              image_caption: 'Blouse',
            ),
            category(
              image_location: 'images/frock.jpg',
              image_caption: 'Frock',
            ),
            category(
              image_location: 'images/jercee.jpg',
              image_caption: 'Jercy',
            ),
            category(
              image_location: 'images/saree.jpg',
              image_caption: 'Saree',
            ),
            category(
              image_location: 'images/shirt.png',
              image_caption: 'T-shirt',
            ),
            category(
              image_location: 'images/shoes.jpg',
              image_caption: 'Shoes',
            ),
            category(
              image_location: 'images/shorts.png',
              image_caption: 'Shorts',
            ),
            category(
              image_location: 'images/skirts.png',
              image_caption: 'Skirts',
            ),
            category(
              image_location: 'images/trousers.gif',
              image_caption: 'Trousers',
            ),
            category(
              image_location: 'images/tshirt.jpg',
              image_caption: 'Shirts',
            ),

          ],

        )
    );
  }
}
class category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  category({
    this.image_caption,this.image_location,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap:(){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location,
              height: 60.0,
              width: 100.0,
            ),
            subtitle: Container(alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),

    );
  }
}