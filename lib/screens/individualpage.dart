import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

class individualpage extends StatefulWidget {
  const individualpage({Key? key,required this.chat}) : super(key: key);
  final chatModel chat;

  @override
  State<individualpage> createState() => _individualpageState();
}

class _individualpageState extends State<individualpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 70,
        backgroundColor: Color(0xFF075E54),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back,size: 24,),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(widget.chat.isGroup?'assets/groups_black_36dp.svg':'assets/person_black_36dp.svg',color: Colors.white,
                  height: 35,
                  width: 20,
                  allowDrawingOutsideViewBox: true,
               )
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text(widget.chat.name,style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.bold),),
              Text("last seen 10:38",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal),)
            ],),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context){
                return[
                  PopupMenuItem(child: Text("View contact"),value: "View contact",),
                  PopupMenuItem(child: Text("Media,links and docs"),value: "New broadcast",),
                  PopupMenuItem(child: Text("Search"),value: "Whatsapp Web",),
                  PopupMenuItem(child: Text("Mute"),value: "Starred messages",),
                  PopupMenuItem(child: Text("More"),value: "Settings",),
                ];
              })
        ],
      ),
    );
  }
}
