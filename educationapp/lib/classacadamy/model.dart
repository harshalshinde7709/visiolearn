import 'dart:io';
import 'package:educationapp/models/model3d.dart';
import 'package:educationapp/src/features/chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  bool loadanime = false;
  bool _loading = true;
  bool toggle = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output!;
      //print(output);
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/mlmodels/model_unquant.tflite',
      labels: 'assets/mlmodels/labels.txt',
    );
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  void loadingAmine()async{
    loadanime = true;
    setState(() {
      
    });
  }

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
              }, 
              icon: const Icon(Icons.chat_outlined,color: Colors.black,)),
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
            color: const Color.fromARGB(255, 221, 196, 247),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 196, 247),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: _loading == true
                        ? const SizedBox()
                        : Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width * .75,
                                width: MediaQuery.of(context).size.width * .75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              //(_output!=null) ?
                                  // ? Text(
                                  //     "output:  ${_output[0]['label']}",
                                  //     style: const TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 18,
                                  //       fontWeight: FontWeight.w400,
                                  //     ),
                                  //   )
                                  
                                  GestureDetector(
                                    onTap: ()async{
                                      if(loadanime==false){
                                        loadingAmine();
                                        loadanime = !await modelSelection(context,_output[0]['label']);

                                        setState(() {
                                          
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width - 100,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 17,
                                      ),
                                      decoration: BoxDecoration(
                                        color:const Color.fromARGB(255, 124, 1, 246),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: loadanime ? 
                                      // ignore: dead_code
                                      LoadingAnimationWidget.prograssiveDots(
                                        color: Colors.white, 
                                        size: 20,
                                      ):
                                      Text(
                                        "Create Model of ${_output[0]['label']}",
                                        style: const TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                  ),
                  // Column(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: pickImage,
                  //       child: Container(
                  //         width: MediaQuery.of(context).size.width - 200,
                  //         alignment: Alignment.center,
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 24,
                  //           vertical: 17,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: const Color.fromRGBO(2, 167, 177, 1),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         child: const Text(
                  //           "Take a photo",
                  //           style: TextStyle(color: Colors.white, fontSize: 16),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 30,
                  //     ),
                  //     GestureDetector(
                  //       onTap: pickGalleryImage,
                  //       child: Container(
                  //         width: MediaQuery.of(context).size.width - 200,
                  //         alignment: Alignment.center,
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 24,
                  //           vertical: 17,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: const Color.fromRGBO(2, 167, 177, 1),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         child: const Text(
                  //           "Pick from Gallery",
                  //           style: TextStyle(color: Colors.white, fontSize: 16),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: pickImage, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 124, 1, 246),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.camera_alt_outlined),
                            SizedBox(width: 5,),
                            Text(
                              "Take a photo",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: pickGalleryImage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 124, 1, 246),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                        ), 
                        child: const Row(
                          children: [
                            Icon(Icons.photo_outlined),
                            SizedBox(width: 5,),
                            Text(
                              "Pick from Gallery",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        );
  }
}