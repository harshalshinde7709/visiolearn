import 'package:educationapp/classacadamy/model.dart';
import 'package:educationapp/src/features/chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
          alignment: Alignment.centerLeft,
        ),
        title:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage(
              "assets/pngs/hat.png",
            ),
            height: 30,
            width: 30,
          ),
          Text(
            "VisioLearn",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ]),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 124, 1, 246),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const ChatScreen(),
                  ),
                );
              }, icon: const Icon(Icons.chat_outlined,color: Colors.black,)),
          const SizedBox(
            width: 10,
          ),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          // const SizedBox(
          //   width: 10,
          // )
        ],
      ),
      body: Container(
          color:  const Color.fromARGB(255, 221, 196, 247),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> const ModelPage(),
                    ),
                  );
                },
                child: Container(
                  height: 190,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  margin: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: const DecorationImage(image: AssetImage("assets/images/biology.jpg")),
                    color: Colors.black
                  ),
                  child: const Text(
                    "Biology",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> const ModelPage(),
                    ),
                  );
                },
                child: Container(
                  height: 190,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  margin: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: const DecorationImage(image: AssetImage("assets/images/maths.jpg")),
                    color: Colors.black
                  ),
                  child: const Text(
                    "Maths",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> const ModelPage(),
                    ),
                  );
                },
                child: Container(
                  height: 190,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  margin: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: const DecorationImage(image: AssetImage("assets/images/chemistry.jpg")),
                    color: Colors.black
                  ),
                  child: const Text(
                    "Chemistry",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}