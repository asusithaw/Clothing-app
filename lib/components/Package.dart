import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Product_Details.dart';

class products extends StatefulWidget {
  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  var product_list = [
    {
      "name": "Blazzer",
      "picture":"images/nblazzer.jpg",
      "old_price":"Rs 8750",
      "price":"Rs 8000",
      "description":"The blue blazer from V Amba by Chandana Balasooriya will effortlessly elevate your Weekend style .Crafted from cotton with a hint of stretch,this design is tailored in an ultra slim fit and features a single breasted 1-button closure. Layer it over a T-shirt, jeans and suede loafers to finish your ensemble. ",
    },
    {
      "name": "Frock",
      "picture":"images/nfrock.jpg",
      "old_price":"Rs 3750",
      "price":"Rs 3500",
      "description":"Spruce up your wardrobe with this black dress from Amba  shopping. This dress is perfect for a day out with friends or a night of get-togethers with family. You can layer it with a denim jacket or  a single."
    },
    {
      "name": "Frock",
      "picture":"images/nfrock.jpg",
      "old_price":"Rs 3750",
      "price":"Rs 3500",
      "description":"Spruce up your wardrobe with this black dress from Amba  shopping. This dress is perfect for a day out with friends or a night of get-togethers with family. You can layer it with a denim jacket or  a single."
    },
    {
      "name": "Frock",
      "picture":"images/nfrock.jpg",
      "old_price":"Rs 3750",
      "price":"Rs 3500",
      "description":"Spruce up your wardrobe with this black dress from Amba  shopping. This dress is perfect for a day out with friends or a night of get-togethers with family. You can layer it with a denim jacket or  a single."
    },
    {
      "name": "Frock",
      "picture":"images/nfrock.jpg",
      "old_price":"Rs 3750",
      "price":"Rs 3500",
      "description":"Spruce up your wardrobe with this black dress from Amba  shopping. This dress is perfect for a day out with friends or a night of get-togethers with family. You can layer it with a denim jacket or  a single."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context,int index){
          return prod(
            prod_name: product_list[index]['name'],
            prod_picture : product_list[index]['picture'],
            prod_old_price : product_list[index]['old_price'],
            prod_price : product_list[index]['price'],
            prod_description : product_list[index]['description'],
          );
        }
    );


  }
}
class prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_description;
  prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
    this.prod_description,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag:Text("Hero") ,
        child: Material(
          child: InkWell(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(
              ProductDetails_name:prod_name,
              ProductDetails_picture:prod_picture,
              ProductDetails_price:prod_price,
              ProductDetails_old_price:prod_old_price,
              ProductDetails_description:prod_description,
            ),
            )),
            child: GridTile(
              child: Image.asset(prod_picture,fit: BoxFit.cover,),
              footer: Container(
                color:Colors.white60,
                child:ListTile(
                  leading:Text(prod_name,style:TextStyle(fontWeight:FontWeight.bold)),
                  title:Text(prod_price,style: TextStyle(color:Colors.black,fontWeight:FontWeight.w800),),
                  subtitle: Text(prod_old_price,style: TextStyle(color:Colors.black87,fontWeight:FontWeight.w800,decoration: TextDecoration.lineThrough),),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}