import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
 final String name;
 final Function onPresed;
 MyButton({required this.name,required this.onPresed});

  @override
  Widget build(BuildContext context) {
 double screenWidth = MediaQuery.of(context).size.width;
 double screenHeight = MediaQuery.of(context).size.height;
    return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: screenHeight/16,
                  width: screenWidth,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:  Colors.red
                    ),
                    onPressed:() {
                      onPresed;
                    },
                   child: Text(name,
                   style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w400
                   ),),)
                );
  }
}