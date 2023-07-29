import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';

class MyPasswordTextFormField extends StatefulWidget {
  TextEditingController controller;
  String title;
 MyPasswordTextFormField({required this.title,required this.controller});

  @override
  State<MyPasswordTextFormField> createState() => _MyPasswordTextFormFieldState();
}

class _MyPasswordTextFormFieldState extends State<MyPasswordTextFormField> {
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
                          controller: widget.controller,
                          obscureText: obscureText,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector
                          (
                            onTap: () {
                              setState(() {
                                obscureText=!obscureText;
                              });
                            },
                            child: Icon(obscureText==true?Icons.visibility:Icons.visibility_off)),
                          hintText: widget.title,
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          ),
                          fillColor:  kPrimaryLightColor,
                          filled: true
                        ),
                        );
  }
}