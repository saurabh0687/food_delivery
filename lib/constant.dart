import 'package:flutter/material.dart';
const kPrimaryColor=Color(0xFF6F35A5);
const kPrimaryLightColor=Color(0xFFF1E6FF);
const double kDefaultPadding=16.0;
class resturantdata
{
  final String img,txt,rating,reviews,name;
  resturantdata(
    {
      required this.img,
      required this.name,
      required this.txt,
      required this.rating,
      required this.reviews
    }
  );
}
List<resturantdata> resturt=[
resturantdata(img: "https://media.istockphoto.com/id/854582038/photo/pizza-hut.jpg?s=612x612&w=0&k=20&c=N5JQok6XJ8vgi89gMOSFnbjJN18O5J3pfVKPvvbysRo=",name: "Pizza Hut", rating:"4.5", txt: "Deliver in 10  min", reviews: "137"),
resturantdata(img:"https://cf-images.us-east-1.prod.boltdns.net/v1/static/1660653193/81804b87-b981-463d-aa7c-82bcdd361519/e6add8df-e34c-4bb4-8d62-3a3cef43d591/1280x720/match/image.jpg",name:"Food Corner", rating: "4.5", txt: "deliver 5 min ", reviews:"157"),
resturantdata(img: "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",name: "Kake tha Dhaba", txt: "Deliver in 8 min", rating:"4.6", reviews:"149"),
resturantdata(img: "https://media.vogue.in/wp-content/uploads/2020/08/chole-bhature-recipe.jpg",name: "Indian Masala", txt: "Best in Taste", rating: "4.3", reviews:"134")
];