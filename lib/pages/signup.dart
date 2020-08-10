import 'package:ecommerce/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import'../db/users.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ecommerce/pages/login.dart';



class SignUp extends StatefulWidget{
  @override
  
  SignUpState createState()=>SignUpState();

 
  
  }
  
  class SignUpState extends State<SignUp> {
    final FirebaseAuth firebaseAuth =  FirebaseAuth.instance;
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _nameTextController = TextEditingController();
    TextEditingController _confirmPasswordTextController = TextEditingController();
    UserServices _userServices = UserServices();
    
    final _formKey = GlobalKey<FormState>();
    String gender;
    String groupValue ="masculin";
    bool loading = false;
    bool isLogedin = false;
    bool hidepass=true;
    @override
       Widget build(BuildContext context) {
         
         return Scaffold(
             
         
         body: Stack(
           
           children:<Widget>[
            Image.asset("tes/bg2.png",
             fit: BoxFit.fill,
             width: double.infinity,),
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,

            ),  
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                     child: Form(
                       key:_formKey,
                       child:ListView(children: <Widget>[
                         
                          Padding(padding: const EdgeInsets.all(8.0),
                         child: Material(
                           borderRadius:BorderRadius.circular(20.0),
                           color: Colors.white.withOpacity(0.5),
                           elevation:0.0,
                           child:Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                           child: TextFormField(
                             controller: _nameTextController,
                             decoration:InputDecoration(hintText: "Nom complet",
                             icon:Icon(Icons.person_outline),
                              border: InputBorder.none),
                             validator: (value){
                               if(value.isEmpty){
                                 return "le champ nom de passe ne peut rester vide";
                               }return null;
                             },
                           
                             
                           ),
                           
                           ),
                           
                           
                           
                           
                         ),
                         ),

                      Padding(
                        padding:  const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                        child: Container(
                          color:Colors.red.withOpacity(0.4),
                          child: Row(children: <Widget>[
                            Expanded(child: ListTile(
                              title: Text("masculin", style: TextStyle(color:Colors.white), textAlign: TextAlign.end,),
                            
                            trailing: Radio(value: "masculin", groupValue: groupValue, onChanged: (e)=> valueChanged(e))
                            ,)
                            ),
                            Expanded(child: ListTile(
                              title: Text("feminin", style: TextStyle(color:Colors.white),textAlign: TextAlign.end,),
                            
                            trailing: Radio(value: "feminin", groupValue: groupValue, onChanged: (e)=> valueChanged(e))
                            ,)
                            )
                          ],),
                        ),
                      ),

                         


                         Padding(padding: const EdgeInsets.all(8.0),
                         child: Material(
                           borderRadius:BorderRadius.circular(20.0),
                           color: Colors.white.withOpacity(0.5),
                           elevation:0.0,
                           child:Padding(padding: const EdgeInsets.only(left:4.0),
                           child: TextFormField(
                             controller: _emailTextController,
                             decoration:InputDecoration(hintText: "Email",
                             icon:Icon(Icons.alternate_email),
                              border: InputBorder.none),
                           validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'entrer une adresse valide';
                                      else
                                        return null;
                                    }
                             },
                           ),
                           
                           ),
                           
                           
                         ),
                         ), Padding(padding: const EdgeInsets.all(8.0),
                         child: Material(
                           borderRadius:BorderRadius.circular(20.0),
                           color: Colors.white.withOpacity(0.5),
                           elevation:0.0,
                           child:Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                           child: ListTile(
                                title: TextFormField(
                               controller: _passwordTextController,
                               obscureText: hidepass,
                               decoration:InputDecoration(hintText: "mot de passe",
                               icon:Icon(Icons.lock),
                                border: InputBorder.none),
                               validator: (value){
                                 if(value.isEmpty){
                                   return "le champ mot de passe ne peut rester vide";
                                 }else if(value.length<6){
                                   return "le mot de passe doit contenir 6 caractere";
                                 }return null;
                               },
                               
                             
                               
                             ),
                             trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){

                               setState(() {
                                 
                                  hidepass = false;
                               });
                             }),
                           ),
                           
                           ),
                           
                           
                           
                           
                         ),
                         ),
                         // Padding(padding: const EdgeInsets.all(8.0),
                         //child: Material(
                           //borderRadius:BorderRadius.circular(20.0),
                           //color: Colors.white.withOpacity(0.5),
                           //elevation:0.0,
                           //child:Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                           //child: ListTile(
                             //   title: TextFormField(
                               //controller: _confirmPasswordTextController ,
                                //obscureText: hidepass, 
                                
                               //decoration:InputDecoration(hintText: "Confirmation du mot de passe",
                               //icon:Icon(Icons.lock),
                               //border: InputBorder.none),
                               //validator: (value){
                                 //if(value.isEmpty){
                                   //return "le champ mot de passe ne peut rester vide";
                                 //}else if(value.length<6){
                                  // return "le mot de passe doit contenir 6 caractere";
                                 //}else if(_passwordTextController.text!=value)
                                // {
                                  // return "le mot de passe ne pas correcte";
                                 //}return null;
                               //},
                             
                               
                            // ),
                             //trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                               //setState(() {
                                 //hidepass= true;
                               //});
                             //}),
                             
                             
                           //),
                           
                           //),
                           
                           
                           
                           
                        // ),
                        // ),
                         
                         
                         
                      Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                         child: Material(
                           borderRadius:BorderRadius.circular(20.0),
                           color: Colors.blue,
                           elevation:0.0,
                            child: MaterialButton(
                                onPressed: () async{
                                  validateForm();
                                },
                                                        minWidth:MediaQuery.of(context).size.width,
                                                        child: Text("Register", textAlign:TextAlign.center,
                                                        style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 20.0)
                                                        ),
                                                        
                                                        
                                                        ),
                                                        ),
                                                        
                                                        
                                                      ),
                                                       
                                                     Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                                                     
                                                     child:InkWell(onTap: (){
                                                       Navigator.pop(context);
                                                     },
                                                     child: Text("Connexion", textAlign: TextAlign.center, style: TextStyle(color:Colors.red, fontSize: 20.0,), ),
                                                     ))
                             
                             
                                                      // Divider(color:Colors.red),
                                                      // Text("Other login option",style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 20.0)),
                                                      // Padding(padding: const EdgeInsets.all(8.0),
                                                      //child: Material(
                                                       // borderRadius:BorderRadius.circular(20.0),
                                                      //  color: Colors.red,
                                                      //  elevation:0.0,
                                                       // child:MaterialButton( onPressed: (){
                                                         //              handleSignIn();
                                            
                                                              //                   },
                                                     //   minWidth:MediaQuery.of(context).size.width,
                                                     //   child: Text("Google", textAlign:TextAlign.center,
                                                      //  style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 20.0)
                                                      //  ),
                                                        
                                                        
                                                      //  ),
                                                       // ),
                                                        
                                                        
                                                      //),
                                                      ],
                                                    )
                                                  ),
                                                
                                                  
                                               
                                              ),
                                         ),
                             
                                         
                                            Visibility(
                                              visible: loading??true,
                                              child:Center(
                                                child:Container(
                                                 
                                             
                                                 alignment: Alignment.center,
                                              color:Colors.white.withOpacity(0.7),
                                              child:CircularProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.red))
                                                
                                              )
                                              
                                            ),
                                            )
                                           
                                        ]
                                      ),
                                      
                                       );
                             
                                    }
                                    valueChanged(e){
                                      setState(() {
                                        if(e=="masculin"){
                                          groupValue = e;
                                          gender = e;
                                        }else if(e=="feminin")
                                        {
                                          groupValue = e;
                                          gender =e;
                                        }
                                      });
                                    }
                             
                               Future validateForm() async{
                                 FormState formState = _formKey.currentState;
                                 if(formState.validate()){
                                   formState.reset();
                                   FirebaseUser user = await firebaseAuth.currentUser();
                                   if(user==null){
                                     firebaseAuth
                                     .createUserWithEmailAndPassword(
                                       email: _emailTextController.text,
                                        password: _passwordTextController.text).
                                        then((user)=>{ 
                                          
                                         _userServices.createUser(
                                          
                                           {
                                               "username": _nameTextController.text,
                                          "email":_emailTextController.text,
                                          "userId": user.user.uid,
                                          "gender": gender,
                                           }
                                         )
                                          
                                          
                                        });
                                 
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

                                   }
                                 }
                               }
  }