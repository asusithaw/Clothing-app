import 'package:flutter/material.dart';
import 'Cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amba Cart", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: (){}),
        ],
      ),
      body: Cart_products(),
      bottomNavigationBar: Container(
        color:Colors.white60,
        child:Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total:"),
                subtitle: Text("Rs 13,580",style: TextStyle(fontWeight:FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20.0),),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: (){},
                child: Text("Check out",style:TextStyle(color: Colors.black)),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}