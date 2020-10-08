import 'package:flutter/material.dart';
class ProductDetails extends StatefulWidget {
  final ProductDetails_name;
  final ProductDetails_picture;
  final ProductDetails_old_price;
  final ProductDetails_price;
  final ProductDetails_description;
  ProductDetails({
    this.ProductDetails_name,
    this.ProductDetails_picture,
    this.ProductDetails_old_price,
    this.ProductDetails_price,
    this.ProductDetails_description,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amba shopping", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: (){}),
        ],
      ),
      body: ListView(
        children:<Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.ProductDetails_picture),
                color: Colors.white60,
              ),
              footer: Container(
                color:Colors.white60,
                child:ListTile(
                  leading: Text(widget.ProductDetails_name,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16.0),),
                  title: Row(
                    children:<Widget>[
                      Expanded(
                        child:Text(widget.ProductDetails_old_price,style: TextStyle(fontWeight:FontWeight.bold,decoration:TextDecoration.lineThrough,color: Colors.black,)
                        ),
                      ),
                      Expanded(
                          child:Text(widget.ProductDetails_price,style: TextStyle(fontWeight:FontWeight.bold,fontSize:23.0),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child:MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("Choose the size"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.blueGrey,
                  textColor: Colors.black,
                  elevation: 0.3,
                  child: Row(
                    children:<Widget>[
                      Expanded(child: Text("Size"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child:MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Color"),
                            content: Text("Choose the color"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.blueGrey,
                  textColor: Colors.black,
                  elevation: 0.3,
                  child: Row(
                    children:<Widget>[
                      Expanded(child: Text("Color"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child:MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Choose the quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.blueGrey,
                  textColor: Colors.black,
                  elevation: 0.3,
                  child: Row(
                    children:<Widget>[
                      Expanded(child: Text("Qty"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children:<Widget>[
              Expanded(
                child:MaterialButton(
                  onPressed: (){},
                  hoverColor: Colors.cyanAccent,
                  color: Colors.blue,
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: Text("Buy now",style:TextStyle(fontWeight:FontWeight.bold,fontSize:16.0)),
                ),
              ),
              IconButton(icon: Icon(Icons.add_shopping_cart,color:Colors.black87), onPressed: (){},),
              IconButton(icon: Icon(Icons.favorite_border,color:Colors.black87), onPressed: (){},),
            ],
          ),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text(widget.ProductDetails_description),
          ),
          Divider(
          ),
          Row(children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text("Product name",style: TextStyle(color:Colors.grey),),
            ),
            Padding(padding: EdgeInsets.all(5.0),
              child:Text(widget.ProductDetails_name),
            )
          ],
          ),
          Row(children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text("Product brand",style: TextStyle(color:Colors.grey),),
            ),
            Padding(padding: EdgeInsets.all(5.0),
              child:Text("Brand V-Amba"),
            )
          ],
          ),
          Row(children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text("Product condition",style: TextStyle(color:Colors.grey),),
            ),
            Padding(padding: EdgeInsets.all(5.0),
              child:Text("Brandnew"),
            )
          ],
          ),
        ],
      ),
    );
  }
}