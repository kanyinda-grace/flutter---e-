import 'package:flutter/material.dart';
import'package:ecommerce/pages/cart_product.dart';


class Cart extends StatefulWidget{
  @override
    CartState createState()=> CartState();
  }

class CartState extends State<Cart> 
{
   @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            appBar: new AppBar(
           elevation: 0.0,
          backgroundColor: Colors.red,
        title:Text('Shopping'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed:(){}, color: Colors.white,),
           
        ],
         ),
         body: new Cart_Product(),
         bottomNavigationBar : new Container(
             color : Colors.white,
             child : Row(
                 children:<Widget>[
                     Expanded(child: ListTile(
                         title: new Text("Total"),
                         subtitle : new Text("\$300")
                     )),
                     Expanded(
                         child : new MaterialButton(onPressed:(){},color:Colors.red,
                         child:new Text("Check out", style: TextStyle(color:Colors.white)))
                     ),
                 ]
             )
         )
    );
  } 
}

