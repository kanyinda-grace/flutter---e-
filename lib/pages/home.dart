
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/horizontal_listview.dart';
import'package:ecommerce/components/Produits.dart';
import'package:ecommerce/pages/cart.dart';


class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=> new HomePageState();
    }
  
  class HomePageState extends State<HomePage>{
 
  @override
   

  Widget build(BuildContext context) {
    
    Widget imageCarousel= new Container(
       height: 200.0,
       child: new Carousel(
         boxFit:BoxFit.cover,
         images:[
           AssetImage('tes/bg1.png'),
           AssetImage('tes/bg2.png'),
           AssetImage('tes/h1.png'),
           AssetImage('tes/g1.png'),
         ],
         autoplay:true,
         animationCurve:Curves.fastOutSlowIn,
         animationDuration : Duration(milliseconds:1000),
         indicatorBgPadding : 2.0,
         dotBgColor: Colors.transparent,
       )
  
   );

       return new Scaffold(
         appBar: new AppBar(
           elevation: 0.0,
          backgroundColor: Colors.red,
        title:Text('BileleApp'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed:(){}, color: Colors.white,),
           new IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>new  Cart()));
           }, color: Colors.white,)
        ],
         ),
         drawer: new Drawer(
           child:new ListView(
             children:<Widget>[
               new UserAccountsDrawerHeader(
                 accountName:Text("Grace"),
                 accountEmail:Text('kanyindaolivier@gmail.com'),
                 currentAccountPicture:GestureDetector(
                   child:new CircleAvatar(
                      backgroundColor:Colors.grey,
                   child: Icon(Icons.person,color:Colors.white)
                   )
                  
                   ),
                   decoration: new BoxDecoration(
                     color:Colors.red
                   ),
                   
               ),




               InkWell(
                 onTap: (){},
           child: ListTile(
                  title:Text("Accueil"),
                   leading:Icon(Icons.home, color: Colors.red)
                 ),
               ),
               InkWell(
                 onTap: (){},
           child: ListTile(
                  title:Text("Mon compte"),
                   leading:Icon(Icons.person, color: Colors.green,)
                 ),
               ),InkWell(
                 onTap: (){},
           child: ListTile(
                  title:Text("My orders"),
                   leading:Icon(Icons.shopping_basket, color: Colors.green,)
                 ),
               ),InkWell(
                 onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>new  Cart()));},
           child: ListTile(
                  title:Text("Shopping cart"),
                   leading:Icon(Icons.shopping_cart, color: Colors.green,)
                 ),
               ),InkWell(
                 onTap: (){},
           child: ListTile(
                  title:Text("Mes favories"),
                   leading:Icon(Icons.favorite, color: Colors.green,)
                 ),
               ),
               Divider(),
               InkWell(
                 onTap: (){},
           child: ListTile(
                  title:Text("Parametre"),
                   leading:Icon(Icons.settings, color: Colors.grey,)
                 ),
               ),InkWell(
                 onTap: (){},
           child: ListTile(
                  title:Text("A propos"),
                   leading:Icon(Icons.help, color: Colors.blue,
                 ),
               )
               ),
               InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),

             ]
           )
         ),
         body: new Column(
           children:<Widget>[
             //image carousel
             imageCarousel,
             //padding Widget
             new Padding(padding: const EdgeInsets.all(8.0),
             child: new Text("Categorie"),
             ),
            

             // horizontal listview
             HorizontalList(),
            // padding to separarate the horizontal listview and the gridview
             new Padding(padding: const EdgeInsets.all(8.0),
             child: new Text("Produits"),
             ),
            //the gridview Container

            new Flexible(
             
              child: Produits()
            ),


            
           ]
         ),
         
           
            

             
         
          
         
         );
  }
}

  

  