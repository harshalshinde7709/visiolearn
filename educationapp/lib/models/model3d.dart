import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

Future getTextData()async{
  responssText = await gemini.generateContentFromText(
    prompt: prompt,
  );
} 

final gemini = GeminiClient(
  model: GenerativeModel(
    model: 'gemini-pro', 
    apiKey: "AIzaSyBJ2XYcU5BCCCjMZ4M0x_B2ZfKba6Fffx0"
  ),
);

String modelName = "";
String str1 = "";
String prompt = "";
String responssText = "";

class Model3D extends StatefulWidget {
  const Model3D({super.key});

  @override
  State<Model3D> createState() => _Model3DState();
}

class _Model3DState extends State<Model3D> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 196, 247),
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     //Sheet();
        //   },
        //   icon: const Icon(Icons.menu),
        //   alignment: Alignment.centerLeft,
        // ),
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
          // IconButton(
          //     onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          // const SizedBox(
          //   width: 10,
          // ),
          IconButton(
            onPressed: () async{
              await getTextData();
              setState(() {
              });
            }, 
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(   
        children: [
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              str1,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: ModelViewer(
              src: 'assets/3dmodels/$modelName',
              alt: 'model',
              ar: true,
              autoRotate: true,
              disableZoom: !false,
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MarkdownBody(
              data: responssText,
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}


class GeminiClient {
  GeminiClient({
    required this.model,
  });

  final GenerativeModel model;

  Future generateContentFromText({
    required String prompt,
  }) async {
    final response = await model.generateContent([Content.text(prompt)]);
    return response.text;
  } 
}

Future<bool> modelSelection(BuildContext context,String str) async{
  str1= str;
  if(str == "heart"){
     modelName = "bio/heart.glb";
     prompt = "define heart and its structure";
  }
  else if(str == "methane"){
    modelName = "che/methane.glb";
    prompt = "describe methane structure";
  }
  else if(str == "brain"){
    modelName = "bio/brain.glb";
    prompt = "describe brain structure";
  }
  else if(str == "nervecell"){
    modelName = "bio/nervecell.glb";
    prompt = "describe nreve cell structure";
  }
  else if(str == "skeleton"){
    modelName = "bio/skeleton.glb";
    prompt = "describe skeleton structure";
  }
  else if(str == "skull"){
    modelName = "bio/skull.glb";
    prompt = "describe skull structure";
  }
  else if(str == "ethane"){
    modelName = "che/ethane.glb";
    prompt = "describe ethane structure";
  }
  else if(str == "ethene"){
    modelName = "che/ethene.glb";
    prompt = "describe ethene structure";
  }
  else if(str == "ethyne"){
    modelName = "che/ethyne.glb";
    prompt = "describe ethyne structure";
  }
  else if(str == "propane"){
    modelName = "che/propane.glb";
    prompt = "describe propane structure";
  }
  else if(str == "propene"){
    modelName = "che/propene.glb";
    prompt = "describe propene structure";
  }
  else if(str == "propyne"){
    modelName = "che/propyne.glb";
    prompt = "describe propyne structure";
  }
  else if(str == "benzene"){
    modelName = "che/benzene.glb";
    prompt = "describe benzene structure";
  }
  else if(str == "nitricacid"){
    modelName = "che/nitricacid.glb";
    prompt = "describe nitric acid structure";
  }
  else if(str == "methenol"){
    modelName = "che/methenol.glb";
    prompt = "describe methenol structure";
  }
  else if(str == "cone"){
    modelName = "math/cone.glb";
    prompt = "describe cone structure in maths";
  }
  else if(str == "cube"){
    modelName = "math/cube.glb";
    prompt = "describe cube structure in maths";
  }
  else if(str == "cylender"){
    modelName = "math/cylender.glb";
    prompt = "describe cylender structure in maths";
  }
  else if(str == "sphere"){
    modelName = "math/sphere.glb";
    prompt = "describe sphere structure in maths";
  }
  else if(str == "hemisphere"){
    modelName = "math/hemisphere.glb";
    prompt = "describe hemisphere structure in maths";
  }
  else if(str == "pyramid"){
    modelName = "math/pyramid.glb";
    prompt = "describe pyramid structure in maths";
  }
  await getTextData();
  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Model3D()));
  return true;
}