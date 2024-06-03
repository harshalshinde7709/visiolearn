import 'package:educationapp/classacadamy.dart';
import 'package:educationapp/classacadamy/underdevelopment.dart';
import 'package:educationapp/login.dart';
import 'package:educationapp/main.dart';
import 'package:educationapp/profile/reviews.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  Future<void> onSubmit()async{
    currentUser!.name = fullNameController.text;
    currentUser!.email = emailController.text;

    await updateData("userInfo", "userName = ?", [currentUser!.userName], currentUser);
    await getUserData();
    setState(() {
      
    });
  }

  void profileBottomSheet(BuildContext context){

    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context, 
      builder: (context){
        return Padding(
          padding:  EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          hintText: "name surname",
                          label: const Text("Enter Your Full Name"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_outline,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please enter fullname";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "abc@gmail.com",
                          label: const Text("Enter Your Email"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please enter email";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                      height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        //color: const Color.fromRGBO(2, 167, 177, 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(2, 167, 177, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child:ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                            onSubmit();
                          },
                          style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 124, 1, 246),
                          ),
                          foregroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(232, 237, 250, 1),
                          ),
                        ),
                        child:const Text(
                          "Save Changes",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 196, 247),
      appBar: AppBar(
        toolbarHeight: 300,
        shadowColor: Colors.grey,
        elevation: 10,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(300),
            bottomRight: Radius.circular(300),
          ),
        ),
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.pop(context);
        //   }, 
        //   icon: const Icon(Icons.arrow_back),
        //   alignment: Alignment.centerLeft,
        // ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   onPressed: (){
                //     //Navigator.pop(context);
                //   }, 
                //   icon: const Icon(Icons.arrow_back),
                //   alignment: Alignment.centerLeft,
                // ),
                Spacer(),
                Image(image: AssetImage("assets/pngs/hat.png",),height: 30,width: 30,),
                Text("VisioLearn",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                Spacer(),
                // IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined)),
                // const SizedBox(width: 10,),
                // IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
                // const SizedBox(width: 10,),
              ],
            ),
            //Spacer(),
            const SizedBox(height: 50,),
            const CircleAvatar(radius:50,backgroundImage: AssetImage("assets/images/profile.jpeg")),
            const SizedBox(height: 20,),
            Text(
              currentUser!.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              currentUser!.email,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 124, 1, 246),
            // actions: [
            //   IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined)),
            //   const SizedBox(width: 10,),
            //   IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
            //   const SizedBox(width: 10,),
            // ],
        ),
          body:  Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Center(
              child: ListView(
                children: [
                  //SizedBox(height: 60,),
                  //CircleAvatar(radius:50,backgroundImage: AssetImage("images/profile.jpeg")),
                  GestureDetector(
                    onTap: (){
                      fullNameController.text = currentUser!.name;
                      emailController.text = currentUser!.email;
                      profileBottomSheet(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                        ),
                      margin: const EdgeInsets.all(10),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 124, 1, 246),
                        ),
                        boxShadow: const[
                          BoxShadow(
                            color: Color.fromARGB(255, 124, 1, 246),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(5,5),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.person_outlined),
                          SizedBox(width: 10,),
                          Text("Profile"),
                        ],
                      ),
                    ),
                  ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                        ),
                      margin: const EdgeInsets.all(10),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 124, 1, 246),
                        ),
                        boxShadow: const[
                          BoxShadow(
                            color: Color.fromARGB(255, 124, 1, 246),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(5,5),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.bookmark_outline),
                          SizedBox(width: 10,),
                          Text("Saved Books"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=> const Reviews(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                        ),
                      margin: const EdgeInsets.all(10),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 124, 1, 246),
                        ),
                        boxShadow: const[
                          BoxShadow(
                            color: Color.fromARGB(255, 124, 1, 246),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(5,5),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.reviews_outlined),
                          SizedBox(width: 10,),
                          Text("Reviews"),
                        ],
                      ),
                    ),
                  ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                        ),
                      margin: const EdgeInsets.all(10),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 124, 1, 246),
                        ),
                        boxShadow: const[
                          BoxShadow(
                            color: Color.fromARGB(255, 124, 1, 246),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(5,5),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.settings_outlined),
                          SizedBox(width: 10,),
                          Text("Settings"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navBarCount = 0;
                      setState(() {
                        
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                        ),
                      margin: const EdgeInsets.all(10),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 124, 1, 246),
                        ),
                        boxShadow: const[
                          BoxShadow(
                            color: Color.fromARGB(255, 124, 1, 246),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(5,5),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(width: 10,),
                          Text("Log Out"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}