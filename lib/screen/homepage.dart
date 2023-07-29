import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/screen/login.dart';
import 'package:food_delivery/screen/profile.dart';
import 'package:food_delivery/screen/resturant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  final List<Widget> _pages=[
    const MainHomePage(),
    const Restaurant(),
      const MainHomePage(),
      ProfileScreen(),

  ];
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages.elementAt(_selectedIndex) ,
     bottomNavigationBar: BottomAppBar(
      color: Colors.white,
      child:SizedBox(
        height: 65,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconBottomBar(icon:Icons.home , text:"Home", selected: _selectedIndex==0,
             onTap:() {
               setState(() {
                 _selectedIndex=0;
               });
             },),
              IconBottomBar(icon:Icons.restaurant , text:"Restaurant", selected: _selectedIndex==1,
             onTap:() {
               setState(() {
                 _selectedIndex=1;
               });
             },),
              IconBottomBar(icon:Icons.map , text:"Map", selected: _selectedIndex==2,
             onTap:() {
               setState(() {
                 _selectedIndex=2;
               });
             },),
              IconBottomBar(icon:Icons.person, text:"Profile", selected: _selectedIndex==3,
             onTap:() {
               setState(() {
                 _selectedIndex=3;
               });
             },),
            ],
          ),
        ),
      ),

     ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    var he=MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left:10,right:10,top: 50),
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
          TopBar(),
          SearchBar(),
          Promocard(),
          HeadLine(),
            SizedBox(
            height: 5,
          ),
          Card2View(),
             SizedBox(
            height: 15,
          ),
          SHeadLine(),
           SizedBox(
            height: 10,
          ),
        
          CardView(),

          ],
        ),
      ),
    );
  }
}
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Find Your\nFavorite Food",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
        Container(
         /* decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(0.25),
              )
            ]
          ),*/
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(Icons.food_bank,
            size: 35,
            color: kPrimaryColor,),
          ),
        )
      ],

    ),
    
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({required this.icon,
  required this.text,
  required this.selected,
  required this.onTap
  });
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
             IconButton(onPressed: onTap, icon: Icon(icon,color: 
             selected?kPrimaryColor:Colors.grey,)),
             Text(
              text,style: TextStyle(
                color: selected?kPrimaryColor:Colors.grey
              ),
             )
      ],
    );
  }
}
class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    EdgeInsets.only(left: 25,right: 25,bottom: 8,top: 8),
    child:Container(
      decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(0.15),
              ),
            ]
          ),
          child: TextField(
            onChanged: (value) {
              
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              filled: true,
               hintText: "search",
              hintStyle: TextStyle(color: Colors.black),
             fillColor: Colors.white,
              //contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)
                
                ),
                
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,width: 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )
            ),
          ),
    ),
    );
  }
}
class Promocard extends StatelessWidget {
  const Promocard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        decoration: BoxDecoration(
       // borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 52, 120, 78),
          kPrimaryColor
          ])
        ),
        child: Stack(
          children: [
            Opacity(opacity: 0.5,
          //  child: Image.network("https://wallpapers.com/images/featured/ice-cream-background-gudzr50hbe61ehdb.jpg",fit: BoxFit.cover,),

            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("Want Some\nIceCream?",style: 
                TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
                ),
              ),
            ),
          Image.network("https://media.istockphoto.com/id/857977278/vector/chocolate-vanilla-ice-bar-ad.jpg?s=612x612&w=0&k=20&c=vVohA8Fq_ZymOiQdRt6MV1T6SSMO0SUJVJxsmvDbC2M=",fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
}
class HeadLine extends StatelessWidget {
  const HeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    EdgeInsets.only(left: 10,right: 10),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Nearest Restaurants",style: TextStyle(
              color: Colors.black,
              fontSize:18,
              fontWeight: FontWeight.bold
            ),
            ),
          Text("The best food close to you",style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black
        ),)
       ] ),
       Text("View All",
       style: TextStyle(
        fontWeight: FontWeight.normal,
        color: kPrimaryColor
       ),)
      ],
    ),
    );
  }
}
class SHeadLine extends StatelessWidget {
  
  const SHeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    EdgeInsets.only(left: 10,right: 10),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Popular Menu",style: TextStyle(
              color: Colors.black,
              fontSize:18,
              fontWeight: FontWeight.bold
            ),
            ),
        /* Text("The best food for you",style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black
        ),)*/
       ] ),
       Text("View more",
       style: TextStyle(
        fontWeight: FontWeight.normal,
        color: kPrimaryColor
       ),)
      ],
    ),
    ); 
  }
}
class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
           Card(
           subtitle: 'Rs. 150.00', text: 'Burger', url: 'https://media.istockphoto.com/id/1206323282/photo/juicy-hamburger-on-white-background.jpg?s=612x612&w=0&k=20&c=K0DxyiChLwewXcCy8aLjjOqkc8QXPgQMAW-vwRCzqG4=',
           ),
             Card(
           subtitle: 'Rs. 100.00', text: 'Coldrink', url:"https://tiimg.tistatic.com/fp/1/007/193/cold-drink-delicious-taste-with-meals-100ml-300ml-500ml-1l-1-25l-2l--403.jpg",
           ),
             Card(
           subtitle: 'Rs. 180.00', text: 'Pizza', url: "https://img.freepik.com/free-photo/thinly-sliced-pepperoni-is-popular-pizza-topping-american-style-pizzerias-isolated-white-background-still-life_639032-229.jpg?w=2000")
        ],
      ),
    );
  }
}
class Card2View extends StatelessWidget {
  const Card2View({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
           Card(
           subtitle: '8 min from you', text: 'Vegan', url: 'https://eatwell.colostate.edu/wp-content/uploads/sites/6/2017/05/Vegan-Symbol.png',
           ),
             Card(
           subtitle: '10 min from you', text: 'Italian', url:"https://images.vexels.com/content/262462/preview/spaghetti-in-fork-italian-food-logo-template-1566ae.png",
           ),
             Card(
           subtitle: '6 min from you', text: 'Indian', url: "https://img.freepik.com/premium-vector/indian-cuisine-spices-icon-with-culinary-seasoning_8071-9904.jpg?w=2000"),
        Card(
           subtitle: '8 min from you', text: 'South Indian', url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoYPLMAPWRjIUQimnD0OFghml6Bbmto6i3Dgc_e3bo&s"),
           Card(
           subtitle: '15 min from you', text: 'Non Veg', url: "https://c8.alamy.com/comp/2AH30CB/non-vegetarian-logo-2AH30CB.jpg")
        ],
      ),
    );
  }
}
class  Card extends StatelessWidget {
  final String text;
  final String url;
  final String subtitle;
  Card({required this.text,required this.url,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    EdgeInsets.only(left: 25,right: 25),
    child: Container(
      width: 130,
      height: 100,
      
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(12,26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.15),
          )
        ]
      ),
      child: Column(
        children: [
          Image.network(url,height: 70,fit: BoxFit.cover,),
          Spacer(),
          Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.black
          ),),
          SizedBox(
            height: 5,
          ),
          Text(subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          ),
         
        ],
      ),
    ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: MediaQuery.of(context).size.width,
      child: GridView.extent(  
        primary: false,  
       padding: const EdgeInsets.all(16),  
         scrollDirection: Axis.vertical,
        crossAxisSpacing:1,  
        mainAxisSpacing: 10,  
        maxCrossAxisExtent: 350.0,  
        children: <Widget>[
       Card(
       subtitle: '8 min from you', text: 'Vegan', url: 'https://eatwell.colostate.edu/wp-content/uploads/sites/6/2017/05/Vegan-Symbol.png',
       ),
         Card(
       subtitle: '10 min from you', text: 'Italian', url:"https://images.vexels.com/content/262462/preview/spaghetti-in-fork-italian-food-logo-template-1566ae.png",
       ),
         Card(
       subtitle: '6 min from you', text: 'Indian', url: "https://img.freepik.com/premium-vector/indian-cuisine-spices-icon-with-culinary-seasoning_8071-9904.jpg?w=2000"),
            Card(
       subtitle: '8 min from you', text: 'South Indian', url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoYPLMAPWRjIUQimnD0OFghml6Bbmto6i3Dgc_e3bo&s"),
       Card(
       subtitle: '15 min from you', text: 'Non Veg', url: "https://c8.alamy.com/comp/2AH30CB/non-vegetarian-logo-2AH30CB.jpg")
            ],
      
      ),
    );
  }
}