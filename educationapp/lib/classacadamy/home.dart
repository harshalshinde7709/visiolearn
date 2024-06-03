import 'package:educationapp/classacadamy/mycourses.dart';
import 'package:educationapp/classacadamy/underdevelopment.dart';
import 'package:educationapp/home/bookstore.dart';
import 'package:educationapp/classacadamy.dart';
import 'package:educationapp/home/leaderboard.dart';
import 'package:educationapp/login.dart';
import 'package:educationapp/main.dart';
import 'package:educationapp/src/features/chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool seeAll = false;

  Future<void> onButtonPressed(Courses obj)async{
    for(int i=0;i<myCourses.length;i++){
      if(obj.courseId == myCourses[i].courseId){
        return;
      }
    }
      await insertData(
        "userCourses",
        MyCourses(courseId: obj.courseId!, userName: currentUser!.userName)
      );
      await getMyCourseData();
      setState(() {
        
      });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        onTap: (){
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
                    child: Text(
                      "Hi, ${currentUser!.name} ",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
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
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context)=> const Underdev(),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.category_outlined,//play_arrow_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Category"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context)=> const Underdev(),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.featured_play_list_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Classes"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context)=> const Underdev(),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.menu_book_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Free Course"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BookStore(),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.shop_2_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("BookStore"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          navBarCount = 2;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> const MyCoursesPage() 
                            ),
                          );
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Live Course"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LeaderBoard(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.leaderboard_outlined,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("LeaderBoard"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      //SizedBox(width: 5,),
                      const Text(
                        "Course For You",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            seeAll = !seeAll;
                            setState(() {});
                          },
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 15, 166)
                            ),
                          ),
                      ),
                      //SizedBox(width: 5,),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  (seeAll)
                      ? ListView.builder(
                          controller: ScrollController(
                            keepScrollOffset: false
                          ),
                          itemCount: courses.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 190,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              margin: const EdgeInsets.only(
                                  right: 20, left: 20, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    getColor1[index % 3],
                                    getColor2[index % 3],
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${courses[index].courseName} Batch 2024",
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(
                                          "Fees: ${courses[index].amount}",
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: (){
                                            onButtonPressed(courses[index]);
                                            //print(myCourses);
                                          }, 
                                          child: const Text(
                                            "Enroll",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 150,
                                    width: 100,
                                    child:
                                        Image.network(courses[index].img,height: 150,width: 100,),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Container(
                          //scrollDirection: Axis.horizontal,
                          height: 242,
                          padding: const EdgeInsets.all(0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context)=> const Course(),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  height: 242,
                                  width: 190,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 22,
                                    vertical: 20,
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        getColor1[index % 3],
                                        getColor2[index % 3],
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          "${courses[index].courseName} Batch 2024",
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 154,
                                        width: 154,
                                        child: Image.network(
                                          "${courses[index].img}",
                                          height: 150,
                                          width: 100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
