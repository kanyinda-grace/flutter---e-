

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Container(
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:<Widget>[
             Category(
               image_location:'tes/h1.png',
               image_caption:'shirt'
             ),
              Category(
               image_location:'tes/h2.png',
               image_caption:'jeans'
             ),
              Category(
               image_location:'tes/h1.png',
               image_caption:'body'
             ),
             Category(
               image_location:'tes/h2.png',
               image_caption:'shoes'
             ),
            ]
          ),
    );
  }


  
}

class Category extends StatelessWidget{

final String image_location;
final String image_caption;



Category(
  {
    this.image_location,
    this.image_caption
  }
);

  @override
  Widget build(BuildContext context) {
    return new Padding(padding:const EdgeInsets.all(2.0),
        child: Container(
          width:100.0,
          child:InkWell(
            onTap: (){},
            child:Container(
              width:100.0,
              child: ListTile(
                title:Image.asset(image_location,
                width: 100.0,
                height: 80.0,
              ),
              subtitle: Container(
                alignment:Alignment.topCenter,
                child:Text(image_caption)
              ),

            ) 
            )
          )
        ),
    );
  }


}