
import 'package:educationapp/classacadamy/menu_drawer.dart';
import 'package:educationapp/classacadamy/home.dart';
import 'package:educationapp/classacadamy/modelselection.dart';
import 'package:educationapp/login.dart';
import 'package:educationapp/main.dart';
import 'package:educationapp/classacadamy/mycourses.dart';
import 'package:educationapp/classacadamy/profile.dart';
import 'package:flutter/material.dart';


class Courses{
  int? courseId;
  String courseName;
  String batch1;
  String batch2;
  String batch3;
  String? batch4;
  String img;
  int amount;

  Courses(
    {
      this.courseId,
      required this.courseName,
      required this.batch1,
      required this.batch2,
      required this.batch3,
      this.batch4,
      required this.img,
      required this.amount
    }
  );

  Map<String,Object?> retMap(){

    return {
      "courseName": courseName,
      "batch1": batch1,
      "batch2": batch2,
      "batch3": batch3,
      "batch4": batch4,
      "img": img,
      "amount": amount
    };
  }
}
Future<void> getCourseData()async{
  List demo = await getData("coursesList");
  
  courses = List.generate(
    demo.length, 
    (index){
      return Courses(
        courseId: demo[index]["courseId"],
        courseName: demo[index]["courseName"], 
        batch1: demo[index]["batch1"], 
        batch2: demo[index]["batch2"], 
        batch3: demo[index]["batch3"],
        batch4: demo[index]["batch4"],
        img: demo[index]["img"],
        amount: demo[index]["amount"]
      );
    }
  );
}

class MyCourses{
  String userName;
  int courseId;
  int? id;

  MyCourses({required this.courseId,required this.userName,this.id});

  Map<String,Object?> retMap(){

    return {
      "courseId": courseId,
      "userName": userName
    };
  }
}

Future<void> getMyCourseData()async{
  List demo= await getData("userCourses");
  myCourses = [];
  for(int i=0;i<demo.length;i++){
    if(demo[i]["userName"]==currentUser!.userName){
      Courses? demo1;
      for(int j=0;j<courses.length;j++){
        if(demo[i]["courseId"]== courses[j].courseId){
          demo1 = courses[j];
          break;
        }
      }
      myCourses.add(demo1);
      //print(myCourses);
    }
  }
}

List myCourses = [];

List courses = [
  // Courses(courseName: "JEE", batch1: "Physics", batch2: "Chemistry", batch3: "Maths",img:"jee.png", amount: 25000),
  // Courses(courseName: "NEET", batch1: "Physics", batch2: "Chemistry", batch3: "Biology",img: "neet.jpeg", amount: 20000),
  // Courses(courseName: "MHTCET", batch1: "Physics", batch2: "Chemistry", batch3: "Maths",batch4: "Biology",img: "cet.jpg", amount: 15000),
];

List getColor1 = [
    const Color.fromRGBO(197, 4, 98, 1),
    const Color.fromRGBO(0, 77, 228, 1),
    const Color.fromARGB(255, 2, 182, 222),
];

List getColor2 = [
    const Color.fromRGBO(80, 3, 112, 1),
    const Color.fromRGBO(1, 47, 135, 1),
    const Color.fromARGB(255, 3, 89, 170),
];

class ClassAcadamy extends StatefulWidget{

  const ClassAcadamy({super.key});

  @override
  State createState()=> _ClassAcadamyState();
}

int navBarCount = 0;
class _ClassAcadamyState extends State{

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(

      //appBar: AppBar(),
      drawer: const MenuDrawer(),
      body: getPages(navBarCount),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          navBarCount = value;
          setState(() {
            
          });
        },
        currentIndex: navBarCount,
        type: BottomNavigationBarType.fixed,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        items:  [
          BottomNavigationBarItem(
            icon: (navBarCount == 0) ?
            const Icon(Icons.home):
            const Icon(Icons.home_outlined),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: (navBarCount == 1) ?
            const Icon(Icons.model_training_rounded):
            const Icon(Icons.model_training_outlined),
            label: "Model"
          ),
          BottomNavigationBarItem(
            icon: (navBarCount == 2) ?
            const Icon(Icons.menu_book):
            const Icon(Icons.menu_book_outlined),
            label: "My Cources"
          ),
          BottomNavigationBarItem(
            icon: (navBarCount == 3) ?
            const Icon(Icons.person):
            const Icon(Icons.person_outlined),
            label: "Profile"
          ),
        ],
      ),
    );
  }

  Widget getPages(int navBarCount){
    if(navBarCount== 1){
      return const Selection();
    }
    if(navBarCount== 2){
      return const MyCoursesPage();
    }
    if(navBarCount== 3){
      return const ProfilePage();
    }
    return const HomePage();
  }
}