import 'package:educationapp/login.dart';
import 'package:flutter/material.dart';


class LeaderBoard extends StatefulWidget{

  const LeaderBoard({super.key});

  @override
  State createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State{

  @override
  Widget build(BuildContext context){

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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Leader Board",
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
                  itemCount: validUsers.length,
                  itemBuilder: (context,index){
                    return Container(
                              height: 60,
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
                                color: const Color.fromARGB(255, 227, 157, 243),
                                borderRadius: BorderRadius.circular(14),
                                // gradient: const LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   colors: [
                                    
                                //   ],
                                // ),
                              ),
                              child: Row(
                                children: [
                                  Text("${index+1}."),
                                  const SizedBox(width: 5,),
                                  Text("${validUsers[index].name}")
                                ],
                              ),
                            );
                  },
                )
              )
            )
          ]
        )
      )
    );
  }
}