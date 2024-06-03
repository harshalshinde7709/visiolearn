import 'package:flutter/material.dart';

class Underdev extends StatelessWidget {
  const Underdev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network("https://akvopedia.org/s_wiki/images/0/02/Icon_under_development.png",height: 200,),
      ),
    );
  }
}