import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key,required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.crop_rounded),iconSize: 28,),
          IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined),iconSize: 28,),
          IconButton(onPressed: (){}, icon: Icon(Icons.title_outlined),iconSize: 28,),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit),iconSize: 28,),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150  ,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(hintText: 'Add Caption....',
                  prefixIcon: Icon(Icons.add_photo_alternate_outlined,color: Colors.white,size: 27,),
                  suffixIcon: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF075E54),
                    child: Icon(Icons.check,color: Colors.white),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.white
                  )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
