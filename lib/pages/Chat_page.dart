import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom-ui/custom_card.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:whatsapp_clone/screens/contact.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({Key? key,required this.chats,required this.chatSource}) : super(key: key);
  final List<chatModel> chats;
  final chatModel chatSource;

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(builder)=>SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chats.length,
        itemBuilder: (context,index)=>Customcard(key: null,chat: widget.chats[index],chatSource: widget.chatSource,),
      ),
    );
  }
}
