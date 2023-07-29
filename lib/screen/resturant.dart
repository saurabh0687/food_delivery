import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return resturantAvailable(context);
  }
}
Widget resturantAvailable(BuildContext context)
{  var he=MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.only(top: 20),
   height: he.height,
   width: he.width,
   decoration: BoxDecoration(
    gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
           Color.fromARGB(255, 83, 69, 164),
           Color.fromARGB(255, 66, 53, 165).withOpacity(.8),
           Color.fromARGB(255, 75, 53, 165).withOpacity(.6),
           Color.fromARGB(255, 121, 112, 159).withOpacity(.4),
           Color.fromARGB(255, 70, 53, 165).withOpacity(.2),
           Color(0xFF6F35A5).withOpacity(.1),
          Color(0xFF6F35A5).withOpacity(.05),
          Color(0xFF6F35A5).withOpacity(.025),



        ])
   ),
   child: SingleChildScrollView(
     child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 18,left: 18,right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Resturant near you",style: TextStyle(
              color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold
            ),),
            IconButton(onPressed:() {
              
            }, icon: Icon(Icons.search,color: Colors.white,size: 30,))
          ],
        ),),
       Column(
        children:resturt.map((e) => restaurantcard(img: e.img, rating: e.rating, txt: e.txt, reviews: e.reviews,name:e.name)).toList(),
       )
 
   
      ],
     ),
   ),
  );
}

class restaurantcard extends StatelessWidget {
  final String img;
  final String rating;
  final String txt;
  final String reviews;
  final String name;
  const restaurantcard({required this.img,required this.rating,required this.txt,required this.reviews,required this.name});

  @override
  Widget build(BuildContext context) {
    var he= MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black
      )
      ),
      height: 400,
      width: he.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children:[ SizedBox(
              height: 270,
              width: he.width,
              child: Image.network(
               img,fit: BoxFit.cover,
              ),
              
              
            ),
            Positioned(
              right: 10,
              bottom: 10,
              
              child:Container(
               decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black)
               ),
                child: Text(name,style: TextStyle(
                  fontWeight: FontWeight.w900,
                  
                  fontSize: 20,
                  color: Colors.red
                ),),
              ), )
            ]
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 10,),
            child: Text(txt,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ 
              Container(
                height: 15,
                child: Image.network("https://static.vecteezy.com/system/resources/previews/013/166/222/non_2x/3d-visual-of-the-five-5-star-sign-star-rating-icon-symbol-for-pictogram-apps-website-or-graphic-design-element-illustration-of-the-rating-1-star-format-png.png"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
                ),
                child: Text("  ${rating} Rating( ${reviews} reviews)  ",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)),
              SizedBox(
                width: he.width/4,
              ),
              GestureDetector(
                onTap: () => print("hii"),
                child: Container(
                 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                     color: Colors.red,
                     border: Border.all(color: Colors.black)
                  ),
                  height: 30,
                  width: 80,
                  child: Center(
                    child: Text("Order Now",
                    style: 
                    TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  ),
                  
                ),
              )
            ],
          )
          
        ],
      ),
    );
  }
}