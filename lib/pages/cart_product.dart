import 'package:ecommerce/pages/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Cart_Product extends StatefulWidget{
  @override
  Cart_ProductState createState()=> Cart_ProductState();
    
}
class Cart_ProductState extends State<Cart_Product>
{
    var Products_on_the_cart = [
    {  "name":"grace",
        "picture":"tes/g1.png",
        "price":120,
        "taille":"M",
        "couleur":"red",
        "quantite":1
        },
        {
        "name":"olivier",
        "picture":"tes/g2.png",
        "price":120,
        "taille":"M",
        "couleur":"black",
        "quantite":1
        },
        
    ];
    

  @override
  Widget build(BuildContext context) {
    
    return new ListView.builder(
      itemCount:Products_on_the_cart.length,
      itemBuilder: (context , index){
        return Single_Cart_Product(
            cart_pro_name:Products_on_the_cart[index]['name'],
            cart_pro_color:Products_on_the_cart[index]['couleur'],
            cart_pro_qte:Products_on_the_cart[index]['quantite'],
            cart_pro_size:Products_on_the_cart[index]['taille'],
            cart_pro_price:Products_on_the_cart[index]['price'],
            cart_pro_picture:Products_on_the_cart[index]['picture'],
        );
      }
    );
  

}
  }
    

    class Single_Cart_Product extends StatelessWidget{


  final cart_pro_name;
  final cart_pro_picture;
  final cart_pro_price;
  final cart_pro_size;
  final cart_pro_color;
  final cart_pro_qte;

  Single_Cart_Product({
    this.cart_pro_name,
    this.cart_pro_picture,
    this.cart_pro_price,
    this.cart_pro_size,
    this.cart_pro_color,
    this.cart_pro_qte
  });

  @override
  Widget build(BuildContext context) {
      return new Card(
   child:ListTile(
      // title section

     leading :  new Image.asset(cart_pro_picture, width: 55.0, height: 55.0),
     title : new Text(cart_pro_name),
     // subtitle section
     subtitle : new Column(
       children : <Widget>[
         //Row inside a column
         new Row(
           // section for the size of product
           children:<Widget>[


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Size"),
            ),
            // padding
            Padding(
              padding: const EdgeInsets.all(8.0),
            child: new Text(cart_pro_size, style: TextStyle(color: Colors.red))
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            child: new Text("\$${cart_pro_price}", style: TextStyle(color: Colors.red))
            ),// padding
            new Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8.0,8.0,8.0),
              child: new Text("${cart_pro_color}")
            ),
            
            
           

           ]
         ),
         
       ]
     ),trailing: new Column(
           children:<Widget>[
             new IconButton(icon: Icon(Icons.arrow_drop_up))
           ]
         )
   )
      );
  }

  
  }

    

 
  