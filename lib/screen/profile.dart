import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
      //  padding: const EdgeInsets.only(left:10,right:10,top: 50),
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
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          centerTitle: true,
          title: Text("Profile",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  LineAwesomeIcons.moon,
                  color: Colors.white,
                ))
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                //  mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        "https://www.hindustantimes.com/static-content/1y/cricket-logos/players/ms-dhoni.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("MS Dhoni",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.grey.shade900)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "msdhoni07@gmail.com",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF6F35A5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: Text(
                          "Edit Profile",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: Colors.white, fontSize: 16),
                        ),
                      )),
                      SizedBox(
                        height: 25,
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ProfileMenu(text: "My Account", icon: LineAwesomeIcons.user_check, press:(){}),
                     
                      ProfileMenu(text: "Billing Details", icon:LineAwesomeIcons.wallet , press:(){}),
                      
                        ProfileMenu(text: "Setting", icon: LineAwesomeIcons.cog ,press:(){}),
                        Divider(
                          thickness: 0.8,
                          color: Colors.grey.shade400,
                          indent: 10,
                          endIndent: 10,
                        ),
                     
                      ProfileMenu(text: "Help & Support", icon:LineAwesomeIcons.question_circle , press:(){}),
                     
                        ProfileMenu(text: "Privacy Policy", icon: LineAwesomeIcons.lock, press:(){}),
                     
                      ProfileMenu(text: "Log Out", icon:LineAwesomeIcons.alternate_sign_out, press:(){},endIcon: false,color: Colors.red,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ProfileMenu extends StatelessWidget {
 final IconData icon;
 final String text;
 final VoidCallback press;
 final bool endIcon;
 final Color? color;
 ProfileMenu({required this.text,required this.icon,required this.press,this.endIcon=true,this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      onTap: press,
      leading: Container(
        width: 40,
        height: 40,
        padding: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
         color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Icon(icon,
        color: color??Colors.grey.shade800,
        size: 22,
        ),
      ),
      title: Text(text,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: color,fontSize: 18),
      ),
      trailing: endIcon?Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
   color: Colors.grey.withOpacity(0.1),
          //color: color?? Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          LineAwesomeIcons.angle_right,
        color: Colors.black,
        size: 16,),
      ):null
    );
  }
}