import 'package:flutter/material.dart';

import '../constant.dart';

class MyTextFormField extends StatelessWidget {
   TextEditingController controller;
  String title;
 MyTextFormField({required this.title,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                          controller:controller ,
                       //   obscureText: true,
                        decoration: InputDecoration(
                          hintText: title,
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