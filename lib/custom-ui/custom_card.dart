import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:whatsapp_clone/screens/individualpage.dart';

import '../model/chat_model.dart';

class Customcard extends StatelessWidget {
  const Customcard({Key? key,required this.chat,required this.chatSource}) : super();
  final chatModel chatSource;

  final chatModel chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => individualpage(chat: chat,chatSource: chatSource,)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(chat.isGroup?'assets/groups_black_36dp.svg':'assets/person_black_36dp.svg',color: Colors.white,
              height: 35,
              width: 20,
              allowDrawingOutsideViewBox: true,
              ),
            ),
            title: Text(chat.name,style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold
            ),),
            subtitle: Row(children: [
              Icon(Icons.done_all),
              SizedBox(width: 13,),
              Text(chat.currentMessage,style: TextStyle(
                  fontSize: 13
              ),),
            ],),
            trailing: Text("23:13"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 20),
            child: Divider(
              thickness: 1.0,
            ),
          )
        ],
      ),
    );
  }
}
