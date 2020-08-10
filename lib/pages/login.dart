import 'package:ecommerce/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';


class Login extends StatefulWidget{
  @override
  
  LoginState createState()=>LoginState();

 
  
  }
  
  class LoginState extends State<Login> {

    final GoogleSignIn googleSignIn = new GoogleSignIn();
    final FirebaseAuth firebaseAuth =  FirebaseAuth.instance;
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    SharedPreferences preferences;
    bool loading = false;
    bool isLogedin = false;

   void iniState(){
     super.initState();
     isSignedIn();
     
        }

        void isSignedIn() async {
         setState(() {
           loading = true;
         });
         //verify if the user exist
         await firebaseAuth.currentUser().then((user){
              if(user!=null){
                setState(()=>isLogedin = true);
              }
         });
         FirebaseUser user = await firebaseAuth.currentUser().then((user){
           if(user !=null){
             setState(()=> isLogedin= true);
           }
         });
         preferences = await SharedPreferences.getInstance();
         isLogedin = await googleSignIn.isSignedIn();
         if(isLogedin){
           Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePage()));
         }
         setState(() {
           loading = false;
         });
       }
       Future handleSignIn() async{
         preferences = await SharedPreferences.getInstance();
         setState(() {
           loading = true;
         });

         GoogleSignInAccount googleUser = await googleSignIn.signIn();
GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken, 
    accessToken: googleSignInAuthentication.accessToken);
FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
         if(firebaseUser!=null){
           final QuerySnapshot result = await Firestore.instance.collection("users").where("id",isEqualTo:firebaseUser.uid).getDocuments();
           final List<DocumentSnapshot> documents = result.documents;

           if (documents.length==0){
             //insert the users in the collection
             Firestore.instance.collection("users").document(firebaseUser.uid).setData({"id":firebaseUser.uid,
             "username": firebaseUser.displayName,
             "profilPicture":firebaseUser.photoUrl});
             await preferences.setString("id", firebaseUser.uid);
             await preferences.setString("usernamme", firebaseUser.displayName);
             await preferences.setString("photoUrl", firebaseUser.displayName);
             
           }else{await preferences.setString("id", documents[0]['id']);
             await preferences.setString("usernamme", documents[0]['username']);
             await preferences.setString("photoUrl", documents[0]['photoUrl']);}
             Fluttertoast.showToast(msg: "vous etes bien enregistrer");
             setState(() {
               loading=false;
             });
         }else{
             
         }
       }
     
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
                       child:Column(children: <Widget>[
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
                                        return 'Please make sure your email address is valid';
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
                               decoration:InputDecoration(hintText: "Password",
                               icon:Icon(Icons.person_outline),
                                border: InputBorder.none),
                               validator: (value){
                                 if(value.isEmpty){
                                   return "le champ mot de passe ne peut rester vide";
                                 }else if(value.length<6){
                                   return "le mot de passe doit contenir 6 caractere";
                                 }return null;
                               },
                             
                               
                             ),
                             trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){}),
                           ),
                           
                           ),
                           
                           
                           
                           
                         ),
                         ),
   
                         
                         
                         
                      Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                         child: Material(
                           borderRadius:BorderRadius.circular(20.0),
                           color: Colors.blue,
                           elevation:0.0,
                           child:MaterialButton(onPressed: (){},
                           minWidth:MediaQuery.of(context).size.width,
                           child: Text("Login", textAlign:TextAlign.center,
                           style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 20.0)
                           ),
                           
                           
                           
                           ),
                           
                           ),
                           
                           
                           
                         ),
                         Padding(padding: const EdgeInsets.fromLTRB(12.0,8.0,12.8,8.0),
                         
                           
                          
                           child:InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp() ));
                             },
                           child: Text("S'enregistrer", textAlign:TextAlign.center,style: TextStyle(color:Colors.red, fontSize: 17.0),
                           )
                           
                           ),
                           
                           
                           
                      
                           
                           
                           
                           
                           
                         ),
                         
                          //Text("Mot de passe oublié",style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 16.0)),

                        // Padding(padding: const EdgeInsets.all(8.0),
                         //child: InkWell(
                         //  onTap:(){
                          ///   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                           //}
                        // ),
                         
                        // ),


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
     
     
       
}