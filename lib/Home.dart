import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/components/HorizontalViewList.dart';
import 'package:flutter_app/components/Package.dart';
import 'Pages/Cart.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Widget ImageSlideCorousel = new Container(
      height:200.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('images/carousel2.jpg'),
          AssetImage('images/carousel3.jpg'),
          AssetImage('images/carousel4.jpg'),
          AssetImage('images/carousel5.jpg'),
          AssetImage('images/carousel6.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        autoplayDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Amba shopping", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.black,),
              onPressed: (){}
          ),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              }
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ImageSlideCorousel,
          Padding(padding: const EdgeInsets.all(8.0),
            child: Text("Categories"),
          ),
          HorizontalList(),
          Padding(padding: const EdgeInsets.all(20.0),
            child: Text("New Arrivals",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
          ),

          Flexible(child: products()),

        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("Susitha Athapaththu"), accountEmail: Text("asusithaw@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person, color: Colors.lime),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.brown,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person, color: Colors.green,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              },
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(Icons.shopping_cart, color: Colors.blueAccent,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.bubble_chart, color: Colors.teal,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Wish List"),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),
            Divider(
              thickness: 16.0,
              color: Colors.blueAccent,
              height: 3.0,
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Settings",style: TextStyle(color: Colors.cyanAccent),),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("About",style: TextStyle(color: Colors.cyanAccent),),
                leading: Icon(Icons.help  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
