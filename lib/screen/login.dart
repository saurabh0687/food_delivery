import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screen/homepage.dart';
import 'package:food_delivery/screen/signup.dart';
import 'package:food_delivery/widget/MyPasswordTextFormField.dart';
import 'package:food_delivery/widget/myTextformfield.dart';
import 'package:food_delivery/widget/toptitle.dart';

class Login extends StatefulWidget {
  
 Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   bool isLoading=false;
  late UserCredential authResult;
  void submit() async{
    setState(() {
      isLoading=true;
    });
    try{
       authResult=await FirebaseAuth.instance.signInWithEmailAndPassword(email:email.text, password:password.text);
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));
    setState(() {
      isLoading=false;
    });
    }
    on PlatformException catch(e){
      String message="Please check interner";
      if(e.message!=null)
      {
      message=e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.toString())));
      setState(() {
        isLoading=false;
      });
      
    }
    catch(e)
    {
      setState(() {
        isLoading=false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  
  }
  
  final TextEditingController email=TextEditingController();

   final TextEditingController password=TextEditingController();

   final GlobalKey<ScaffoldState> scaffold=GlobalKey<ScaffoldState>();

   void validation(context){
    if(email.text.isEmpty){
     const snackBar = SnackBar(
  content: Text('Email is Empty!'),
);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    
   else if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email.text)){
          const snackBar = SnackBar(
  content: Text('Not a valid Email!'),
 // behavior: SnackBarBehavior.floating,
  //backgroundColor: Colors.amber,
);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    else if(password.text.isEmpty){
     const snackBar = SnackBar(
  content: Text('Password is Empty!'),
 // behavior: SnackBarBehavior.floating,
 // backgroundColor: Colors.amber,
);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(password.text.length<8){
     const snackBar = SnackBar(
  content: Text('Minimum length of password should be 8'),
 // behavior: SnackBarBehavior.floating,
 // backgroundColor: Colors.amber,

);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      submit();
    }
    
  
   }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
               Toptitle(title: "Login", subtitle: "Welcome Back!"),
               Container(
                height: screenHeight/4,
                child: Image.network("https://www.pngitem.com/pimgs/m/3-37779_transparent-delivery-png-delivery-boy-with-bike-png.png")
               ),
                Center(
                  child: Container(
                    height: screenHeight/4,
                    width: screenWidth,
                  // color: Colors.amber,
                   padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       MyTextFormField(title: "Email", controller: email),
                        SizedBox(
                          height: 15,
                        ),
                         MyPasswordTextFormField(title: "Password", controller: password)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              isLoading==false? Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: screenHeight/16,
                  width: screenWidth,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:  Color(0xFF6F35A5)
                    ),
                    onPressed:() {
                   validation(context);
                  },
                   child: Text("Login",
                   style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w400
                   ),),)
                ):Center(
                 child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?",
                    style: TextStyle(
                      fontSize: 17,
                    ),),
                    GestureDetector(
              
              
                      onTap:() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>SignUp()));
                      },
                      
                      child: Text("Sign Up",style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor
                      ),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}