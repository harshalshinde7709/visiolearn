
import 'package:flutter/material.dart';

class BookStore extends StatefulWidget {
  const BookStore({super.key});

  @override
  State<BookStore> createState() => _BookStoreState();
}
class Books{
  String name;
  String img;

  Books(
    {
      required this.name,
      required this.img
    }
  );
  
}

List books = [
  //"bio11.jpg","bio12.jpg","ch111.jpg","ch121.jpg","ph111.jpg","ph121.jpg","m11.jpg","m121.jpg"
  Books(name: "Biology XI", img: "bio11.jpg"),
  Books(name: "Biology XII", img: "bio12.jpg"),
  Books(name: "Chemistry XI", img: "ch111.jpg"),
  Books(name: "Chemistry XII", img: "ch121.jpg"),
  Books(name: "Physics XI", img: "ph111.jpg"),
  Books(name: "Physics XII", img: "ph121.jpg"),
  Books(name: "Maths XI", img: "m11.jpg"),
  Books(name: "Maths XII", img: "m121.jpg")

];
class _BookStoreState extends State<BookStore>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
                        "Book Store",
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
                //color: Colors.blueGrey,
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 199, 152, 248),
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/${books[index].img}"),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                books[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 230,
                                padding: EdgeInsets.zero,
                                child: ElevatedButton(
                                  onPressed: (){}, 
                                  child: const Text("Save Book")
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}