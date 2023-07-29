import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screen/homepage.dart';
import 'package:food_delivery/screen/login.dart';
import 'package:food_delivery/widget/MyPasswordTextFormField.dart';
import 'package:food_delivery/widget/myTextformfield.dart';
import 'package:food_delivery/widget/toptitle.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading=false;
  late UserCredential authResult;
  void submit() async{
    setState(() {
      isLoading=true;
    });
    try{
       authResult=await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email.text, password:password.text);
    }
    on PlatformException catch(e){
      String message="Please check interner";
      if(e.message!=null)
      {
      message=e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
    await FirebaseFirestore.instance.collection("UserDate").doc(authResult.user!.uid).set({
      "UserName":fullname.text,
      "UserEmail":email.text,
      "UserNumber":phoneNumber.text,
      "UserAddress":address.text,
      "UserPassword":password.text
     
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));
    setState(() {
      isLoading=false;
    });
  }
   final TextEditingController email=TextEditingController();

   final TextEditingController fullname=TextEditingController();
    final TextEditingController phoneNumber=TextEditingController();

   final TextEditingController password=TextEditingController();
    final TextEditingController address=TextEditingController();
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
       else if(fullname.text.isEmpty){
     const snackBar = SnackBar(
  content: Text('Please Enter your Name!'),
 // behavior: SnackBarBehavior.floating,
 // backgroundColor: Colors.amber,
);

ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
       else if(address.text.isEmpty){
     const snackBar = SnackBar(
  content: Text('Address cannot be Empty!'),
 // behavior: SnackBarBehavior.floating,
 // backgroundColor: Colors.amber,
);

ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
     else if(phoneNumber.text.length!=10){
     const snackBar = SnackBar(
  content: Text('Enter valid PhoneNumber!'),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Toptitle(title: "SignUp", subtitle:"Create an Account"),
                Container(
                height:screenHeight/2 ,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyTextFormField(title: "FullName", controller: fullname),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextFormField(title: "Email", controller: email),
                      SizedBox(
                      height: 10,
                    ),
                    MyTextFormField(title: "Phone Number", controller: phoneNumber),
                      SizedBox(
                      height: 10,
                    ),
                    MyTextFormField(title: "Address", controller: address),
                      SizedBox(
                      height: 10,
                    ),
                    MyPasswordTextFormField(title: "Password", controller: password)
                  ],
                ),
                
                ),
              isLoading==false?Container(
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
                   child: Text("SignUp",
                   style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w400
                   ),),),
                   
                ):Center(
                  child: CircularProgressIndicator(),
                ),
                  SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                    style: TextStyle(
                      fontSize: 17,
                    ),),
                    GestureDetector(
                      onTap:() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Login()));
                      },
                      child: Text("Login",style: TextStyle(
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