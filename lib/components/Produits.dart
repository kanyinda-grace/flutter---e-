import 'dart:async';

import 'package:flutter/material.dart';
import'package:ecommerce/pages/produits_details.dart';

class Produits extends  StatefulWidget{

@override
  ProduitsState createState()=> ProduitsState();

}


 class ProduitsState extends State<Produits>{
    var Produits_liste = [
        {
        "name":"grace",
        "picture":"tes/g1.png",
        "old_price":120,
        "price":85,
        },
        {
        "name":"olivier",
        "picture":"tes/g2.png",
        "old_price":120,
        "price":85,
        },
        {
        "name":"jhon",
        "picture":"tes/g2.png",
        "old_price":120,
        "price":85,
        },
        {
        "name":"cicile",
        "picture":"tes/g2.png",
        "old_price":120,
        "price":85,
        },
        {
        "name":"alain",
        "picture":"tes/g2.png",
        "old_price":120,
        "price":85,
        },
        {
        "name":"nadine",
        "picture":"tes/g2.png",
        "old_price":120,
        "price":85,
        }
    ];

    
  @override
   Widget build(BuildContext context) {
    
         return GridView.builder(
             itemCount:Produits_liste.length,
             gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount:2),
             itemBuilder:(BuildContext context, int index){
                 return Padding(padding: const EdgeInsets.all(4.0),
                 child:Single_prod(
                     prod_name : Produits_liste[index]['name'],
                     prod_picture:Produits_liste[index]['picture'],
                     prod_old_price:Produits_liste[index]['old_price'],
                     prod_price:Produits_liste[index]['price'],
                 )
                 );
                 
                 
                 });

            
         
  
  
}
}


class Single_prod extends StatelessWidget{
    final prod_name;
    final prod_picture;
    final prod_old_price;
    final prod_price;

    Single_prod({
         this.prod_name,
        this.prod_picture,
        this.prod_old_price,
        this.prod_price,
    });

    @override
  Widget build(BuildContext context) {
     return Card(

         child:  Hero(
             tag: prod_name,
             
    child:Material(
        child:InkWell(
    onTap:()=>Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context)=>new ProduitsDetails(
               
                product_detail_name:prod_name,
                product_detail_old_price:prod_old_price,
                product_detail_picture:prod_picture,
                product_detail_new_price:prod_price


            ))),

            child:GridTile(
            footer: Container(
            color:Colors.white,
            child: new Row(
                children:<Widget>[
                    Expanded(
                        child:Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize:20.0))
                    ),
                    new Text("\$${prod_price}", style: TextStyle(color: Colors.red, fontWeight:FontWeight.bold))
                ]
            )
                             ),
                             child:Image.asset(prod_picture,
                             fit:BoxFit.cover),
                             
                      
                     ),)
                 )),
             
         
     );
     
  }
}
