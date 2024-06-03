import 'package:educationapp/classacadamy.dart';
import 'package:educationapp/src/features/chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 221, 196, 247),
        //height: 200,
        child: Column(
          children: [
            Container(
              // height: 200,
              //margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 124, 1, 246),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(Icons.menu),
                        ),
                        const Spacer(),
                        const Image(image: AssetImage("assets/pngs/hat.png",),height: 30,width: 30,),
                        const Text("VisioLearn",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> const ChatScreen(),
                              ),
                            );
                          },
                          child: const Icon(Icons.chat_outlined),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Courses",
                        style: TextStyle(
                          fontSize: 30
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search here...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: myCourses.length,
                  itemBuilder: (context,index){
                    return Container(
                              height: 190,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              margin: const EdgeInsets.only(
                                right: 20,
                                left: 20,
                                bottom: 20
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    getColor1[index%3],
                                    getColor2[index%3],
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          "${myCourses[index].courseName} Batch 2024",
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                        ),
                                      ),
                                      Text(myCourses[index].batch1),
                                      Text(myCourses[index].batch2),
                                      Text(myCourses[index].batch3),
                                      (myCourses[index].batch4!=null)? 
                                      Text(myCourses[index].batch4): 
                                      const SizedBox(),
                                    ],
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Image.network(myCourses[index].img,height: 150,width: 100,),
                                  ),
                                ],
                              ),
                            );
                  },
                )
              )
            )
          ]
        )
      ),
    );
  }
}