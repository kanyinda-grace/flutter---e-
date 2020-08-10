
import 'dart:async';
import 'package:ecommerce/components/Produits.dart';
import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProduitsDetails extends StatefulWidget{
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;
    
    ProduitsDetails({
      this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture,
    });


   @override
   ProduitDetailsState createState()=> ProduitDetailsState() ;

}


class ProduitDetailsState extends State<ProduitsDetails>{
    @override
    Widget build(BuildContext context){
      var image_carousel;
      return new Scaffold(
         appBar: new AppBar(
           elevation: 0.0,
          backgroundColor: Colors.red,
        title:Text('BileleApp'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed:(){}, color: Colors.white,),
           new IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){}, color: Colors.white,)
        ],
         ),
         body: new ListView(
           children:<Widget>[
               new Container(
                 height:300.0,
                 child: GridTile(
                   child: Container(
                     color:Colors.white,
                   child:Image.asset(widget.product_detail_picture),
                   ),
                   footer: new Container(
                     color:Colors.white70,
                     child: ListTile(
                       leading : new Text(widget.product_detail_name,style:TextStyle(fontWeight:FontWeight.bold,fontSize:16.0)),
                       title: new Row(
                         children:<Widget>[
                           Expanded(
                             child:new Text("\$${widget.product_detail_old_price}",style:TextStyle(color:Colors.grey,decoration:TextDecoration.lineThrough))
                           ),
                           Expanded(
                             child:new Text("\$${widget.product_detail_new_price}",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.red))
                           ),
                           
                         ]
                       )
                     )
                   )
                 )
               ),
               Row(
                 children:<Widget>[
                   Expanded(
                     child:MaterialButton(onPressed:(){
                       showDialog(
                         context:context,
                         builder:(context){
                           return new AlertDialog(
                             title : new Text("taille"),
                             content: new Text("choix du taille"),
                             actions:<Widget>[
                               new MaterialButton(onPressed:(){
                                 Navigator.of(context).pop(context);
                               },
                               child:new Text("fermer"),
                               )
                             ]
                           );
                         }
                       );
                     },
                     color:Colors.white,
                     textColor:Colors.grey,
                     child:Row(
                       children:<Widget>[
                         Expanded(
                           child:new Text("Taille")
                         ),
                         Expanded(child:new Icon(Icons.arrow_drop_down))
                       ]
                     ))
                   ),
                    Expanded(
                     child:MaterialButton(onPressed:(){
                       showDialog(
                         context:context,
                         builder:(context){
                           return new AlertDialog(
                             title : new Text("Colour"),
                             content: new Text("choix de la couleur"),
                             actions:<Widget>[
                               new MaterialButton(onPressed:(){
                                 Navigator.of(context).pop(context);
                               },
                               child:new Text("fermer"),
                               )
                             ]
                           );
                         }
                       );
                     },
                     color:Colors.white,
                     textColor:Colors.grey,
                     child:Row(
                       children:<Widget>[
                         Expanded(
                           child:new Text("Color")
                         ),
                         Expanded(child:new Icon(Icons.arrow_drop_down))
                       ]
                     ))
                   ), Expanded(
                     child:MaterialButton(onPressed:(){
                       showDialog(
                         context:context,
                         builder:(context){
                           return new AlertDialog(
                             title : new Text("Quantité"),
                             content: new Text("choix de la QTE"),
                             actions:<Widget>[
                               new MaterialButton(onPressed:(){
                                 Navigator.of(context).pop(context);
                               },
                               child:new Text("fermer"),
                               )
                             ]
                           );
                         }
                       );
                     },
                     color:Colors.white,
                     textColor:Colors.grey,
                     child:Row(
                       children:<Widget>[
                         Expanded(
                           child:new Text("QTE")
                         ),
                         Expanded(child:new Icon(Icons.arrow_drop_down))
                       ]
                     ))
                   ),
                 ]
               ),

               Row(
                 children:<Widget>[
                   Expanded(
                     child:MaterialButton(onPressed:(){},
                     color:Colors.red,
                     textColor:Colors.white,
                     elevation:0.2,
                     child:new Text("Acheter now"))
                   ),
                   new IconButton(icon:Icon(Icons.add_shopping_cart,color:Colors.red),onPressed:(){}),
                   new IconButton(icon:Icon(Icons.favorite_border,color:Colors.red),onPressed:(){}),

                   
                   
                   
                     
                 ]
               ),
               Divider(color:Colors.red),
               new ListTile(
                 title : new Text("details du produit"),
                 subtitle: new Text("Le traitement des caractères de la chaîne ne seffectuent pas de la même manière Le traitement des caractères de la chaîne ne seffectuent pas de la même manière Le traitement des caractères de la chaîne ne seffectuent pas de la même manière Le traitement des caractères de la chaîne ne seffectuent pas de la même manière")
               ),
               Divider(color:Colors.red),
                new Row(
                  children:<Widget>[
                    Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                    child: new Text("nom du produit", style: TextStyle(color: Colors.grey))),
                    Padding(padding: EdgeInsets.all(5.0),
                    child: new Text(widget.product_detail_name),)
                  ]
                ),
                new Row(
                  children:<Widget>[
                    Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                    child: new Text("marque du produit", style: TextStyle(color: Colors.grey),
                    ),
                    )
                    , Padding(padding:EdgeInsets.all(5.0), 
                    child: new Text("Marque X"))
                  ]
                ),
                new Row(
                  children:<Widget>[
                    Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                    child: new Text("condition du produit", style: TextStyle(color: Colors.grey))),
                     Padding(padding:EdgeInsets.all(5.0),
                     child: new Text("nouvelle marque"))
                  ]
                ),

                //section concernant le produits similaire

                Container(
                  height: 340.0,
                  child: Similar_product(),
                ),
                //
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child : new Text("Produits similaire"),
                )


           ]
         )
         

      );  
    } 
}


class Similar_product extends StatefulWidget{
 @override
  Similar_productState createState()=> new Similar_productState();
}

class Similar_productState extends State<Similar_product> {
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
      
    ];

    
  @override
   Widget build(BuildContext context) {
    
         return GridView.builder(
             itemCount:Produits_liste.length,
             gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount:2),
             itemBuilder:(BuildContext context, int index){
                 return Similar_product_pro(
                     prod_name : Produits_liste[index]['name'],
                     prod_picture:Produits_liste[index]['picture'],
                     prod_old_price:Produits_liste[index]['old_price'],
                     prod_price:Produits_liste[index]['price'],
                 );
                 });

            
         
  
  
}
}


class Similar_product_pro extends StatelessWidget{
    final prod_name;
    final prod_picture;
    final prod_old_price;
    final prod_price;

    Similar_product_pro({
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





