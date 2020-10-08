import 'package:flutter/material.dart';
class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart =[{
    "name": "Blazzer",
    "picture":"images/nblazzer.jpg",
    "price":"Rs 8000",
    "size": "XL",
    "color":"Blue",
    "quantity":"1",
  },
    {
      "name": "Frock",
      "picture":"images/nfrock.jpg",
      "price":"Rs 3500",
      "size": "M",
      "color":"red",
      "quantity":"1",
    },
    {
      "name": "Frock",
      "picture":"images/nfrock.jpg",
      "price":"Rs 3500",
      "size": "M",
      "color":"red",
      "quantity":"1",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context,index){
        return Cart_prod(
          cart_prod_name:Products_on_the_cart[index]["name"],
          cart_prod_picture:Products_on_the_cart[index]["picture"],
          cart_prod_price:Products_on_the_cart[index]["price"],
          cart_prod_size:Products_on_the_cart[index]["size"],
          cart_prod_color:Products_on_the_cart[index][ "color"],
          cart_prod_qty:Products_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}
class Cart_prod extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;
  Cart_prod({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_picture,height: 100.0,width: 80.0,),
        title:Text(cart_prod_name),
        subtitle: Column(
            children:<Widget>[
              Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_prod_size,style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_prod_color,style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold),),
                ),
              ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(cart_prod_price,style: TextStyle(color:Colors.grey,fontWeight:FontWeight.bold,fontSize:17.0,fontStyle:FontStyle.italic),),
              ),
            ]
        ),
        trailing: Column(
          children:<Widget>[
//IconButton(
            //icon: Icon(Icons.arrow_drop_up),
            //onPressed: (){},
            //alignment: Alignment.topRight,
            //padding: const EdgeInsets.all(0.0),
            //),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: (){},
              padding: const EdgeInsets.all(0.0),
            ),
          ],
        ),
      ),
    );
  }
}