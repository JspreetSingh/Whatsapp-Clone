import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ownmessage extends StatelessWidget {
  const ownmessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(8)),
          color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 60,bottom: 20,top: 5),
                child: Text("hello vaibhav hbhjbgyjfcgf ghf",style: TextStyle(fontSize: 16),),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text("8:40",style: TextStyle(fontSize: 13,color: Colors.grey[600]),),
                    SizedBox(width: 5,),
                    Icon(Icons.done_all,color: Colors.grey[600],size: 20,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
