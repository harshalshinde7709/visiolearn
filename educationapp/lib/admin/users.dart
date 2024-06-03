import 'package:educationapp/login.dart';
import 'package:educationapp/main.dart';
import 'package:flutter/material.dart';


class UsersList extends StatefulWidget{

  const UsersList({super.key});

  @override
  State createState() => _UsersListState();
}

class _UsersListState extends State{

  Future<void> deleteUser()async{
    await deleteData("userInfo", "userName= ?", [currentUser!.userName], currentUser);
    await getUserData();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        //color:  Colors.grey[200],
        //height: 200,
        child: Column(
          children: [
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
                                top: 20
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
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
                                  Text("${validUsers[index].name}"),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      deleteUser();
                                    },
                                    child: const Icon(Icons.delete_outline),
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
      )
    );
  }
}