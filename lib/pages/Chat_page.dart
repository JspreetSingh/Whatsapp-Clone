import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom-ui/custom_card.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:whatsapp_clone/screens/contact.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({Key? key}) : super(key: key);

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<chatModel>chats = [
    chatModel("Vaibhav","person_black_36dp.svg", "Hi Vaibhav!! How r u", false, "14:39"),
    chatModel("Agam", "person_black_36dp.svg", "Hlo Agam ", false, "2:40"),
    chatModel("Idle Boys", "groups_black_36dp.svg", "Kya kr rhe ho sab", true, "1:59"),
  ];
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
        itemCount: chats.length,
        itemBuilder: (context,index)=>Customcard(key: null,chat: chats[index]),
      ),
    );
  }
}
