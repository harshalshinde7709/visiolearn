import 'package:educationapp/login.dart';
import 'package:educationapp/main.dart';
import 'package:flutter/material.dart';


class Reviews extends StatefulWidget{

  const Reviews({super.key});

  @override
  State createState() => _ReviewsState();
}

class ReviewsClass{
  int starCount;
  String review;
  String userName;

  ReviewsClass(
    {
      required this.starCount,
      required this.review,
      required this.userName

    }
  );

  Map<String,Object> retMap(){

    return {
      "userName": userName,
      "reviews": review,
      "starCount": starCount
    };
  }
}

Future<void> getReviewData()async{
  List data = await getData("userReviews");

  reviewsList = List.generate(
    data.length, 
    (index) {
      return ReviewsClass(
        starCount: data[index]["starCount"],
        review: data[index]["reviews"],
        userName: data[index]["userName"]
      );
    }
  );
}

List reviewsList = [];

TextEditingController reviewController = TextEditingController();
GlobalKey<FormState> reviewKey = GlobalKey();
int count = 1;

class _ReviewsState extends State{

  Future<void> onSubmit()async{
    //print("in on submit");
    ReviewsClass obj = ReviewsClass(
      starCount: count,
      review: reviewController.text,
      userName: currentUser!.userName
    );

    if(isReviewed()){
      await updateData(
        "userReviews", 
        "userName = ?", 
        [obj.userName], 
        obj
      );
      //print("in update");
    }else{
      await insertData("userReviews", obj);
    }
    //print("object");
    reviewController.clear();
    await getReviewData();
    setState(() {
      count = 1;
    });
  }

  bool isReviewed(){

    for(int i=0;i<reviewsList.length;i++){
      if(currentUser!.userName==reviewsList[i].userName){
        count = reviewsList[i].starCount;
        reviewController.text = reviewsList[i].review;
        //print("ret true");
        return true;
      }
    }
    //print("ret false");
    return false;
  }

  void reviewBottomSheet(BuildContext context){

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
                  "add review",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Form(
                key: reviewKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            count = 1;
                            setState(() {});
                          },
                          child: (count>=1)?const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                        ),
                        GestureDetector(
                          onTap: () {
                            count = 2;
                            setState(() {});
                          },
                          child: (count>=2)?const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                        ),
                        GestureDetector(
                          onTap: () {
                            count = 3;
                            setState(() {});
                          },
                          child: (count>=3)?const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                        ),
                        GestureDetector(
                          onTap: () {
                            count = 4;
                            setState(() {});
                          },
                          child: (count>=4)?const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                        ),
                        GestureDetector(
                          onTap: () {
                            count = 5;
                            setState(() {});
                          },
                          child: (count>=5)?const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                      ),
                    TextFormField(
                        controller: reviewController,
                        decoration: InputDecoration(
                          hintText: "rewiew",
                          label: const Text("Enter Review"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(
                            Icons.reviews_outlined,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please enter review";
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
                            bool val = reviewKey.currentState!.validate();
                            if(val){
                              Navigator.pop(context);
                              onSubmit();
                            }
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
                        "Reviews",
                        style: TextStyle(
                          fontSize: 30
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(bottom: 10),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     color: Colors.white
                    //   ),
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       prefixIcon: const Icon(Icons.search),
                    //       hintText: "Search here...",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: reviewsList.length,
                  itemBuilder: (context,index){
                    return Container(
                              height: 100,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${reviewsList[index].userName}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal
                                        ),
                                        ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          (reviewsList[index].starCount>=1)? const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                                          (reviewsList[index].starCount>=2)? const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                                          (reviewsList[index].starCount>=3)? const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                                          (reviewsList[index].starCount>=4)? const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                                          (reviewsList[index].starCount>=5)? const Icon(Icons.star):const Icon(Icons.star_border_outlined),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Expanded(
                                    child: Text(
                                      reviewsList[index].review,
                                      maxLines: 3,
                                    ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          reviewBottomSheet(context);
        },
        label: const Text("add reviews"),
        icon: const Icon(Icons.reviews),
      ),
    );
  }
}