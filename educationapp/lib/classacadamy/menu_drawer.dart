import 'package:educationapp/classacadamy/profile.dart';
import 'package:educationapp/classacadamy/underdevelopment.dart';
import 'package:educationapp/login.dart';
import 'package:educationapp/profile/reviews.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}
int count = 0;
class _MenuDrawerState extends State<MenuDrawer> {
  //int count = 1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 216,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(width: 184,height: 40,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/pngs/hat.png",),
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      "VisioLearn",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Make Learning Easier",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CircleAvatar(radius:50,backgroundImage: AssetImage("assets/images/profile.jpeg")),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    //count = 1;
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> const ProfilePage(),
                      ),
                    );
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 184,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),  
                      ),
                      color: (count == 1)?const Color.fromARGB(255, 189, 170, 209): const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20,),
                        // Image.asset(
                        //   "assets/png/transaction.png",
                        //   height: 17,
                        //   width: 18,
                        // ),
                        const SizedBox(width: 5,),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: (count == 1)?const Color.fromARGB(255, 124, 1, 246):const Color.fromRGBO(33, 33, 33, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ), 
                GestureDetector(
                  onTap: () {
                    //count = 2;
                    Navigator.pop(context);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context)=> const GraphScreen(),
                    //   ),
                    // );
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=> const Underdev(),
                      ),
                    );
                    setState(() {    
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 184,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),  
                      ),
                      color: (count == 2)?const Color.fromARGB(255, 189, 170, 209): const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20,),
                        // Image.asset(
                        //   "assets/png/piechart.png",
                        //   height: 17,
                        //   width: 18,
                        // ),
                        const SizedBox(width: 5,),
                        Text(
                          "Saved Books",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: (count == 2)?const Color.fromARGB(255, 124, 1, 246):const Color.fromRGBO(33, 33, 33, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ), 
                GestureDetector(
                  onTap: () {
                    //count = 3;
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> const Reviews(),
                      ),
                    );
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 184,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),  
                      ),
                      color: (count == 3)?const Color.fromARGB(255, 189, 170, 209): const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20,),
                        // Image.asset(
                        //   "assets/png/category.png",
                        //   height: 17,
                        //   width: 18,
                        // ),
                        const SizedBox(width: 5,),
                        Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: (count == 3)?const Color.fromARGB(255, 124, 1, 246):const Color.fromRGBO(33, 33, 33, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ), 
                GestureDetector(
                  onTap: () {
                    //count = 4;
                    Navigator.pop(context);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context)=> const TrashScreen(),
                    //   ),
                    // );
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=> const Underdev(),
                      ),
                    );
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 184,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),  
                      ),
                      color: (count == 4)?const Color.fromARGB(255, 189, 170, 209): const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20,),
                        // Image.asset(
                        //   "assets/png/trash.png",
                        //   height: 17,
                        //   width: 18,
                        // ),
                        const SizedBox(width: 5,),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: (count == 4)?const Color.fromARGB(255, 124, 1, 246):const Color.fromRGBO(33, 33, 33, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ), 
                GestureDetector(
                  onTap: () {
                    //count = 5;
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> const LogInPage(),
                      ),
                    );
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 184,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),  
                      ),
                      color: (count == 5)?const Color.fromARGB(255, 189, 170, 209): const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20,),
                        // Image.asset(
                        //   "assets/png/aboutus.png",
                        //   height: 17,
                        //   width: 18,
                        // ),
                        const SizedBox(width: 5,),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: (count == 5)?const Color.fromARGB(255, 124, 1, 246):const Color.fromRGBO(33, 33, 33, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}