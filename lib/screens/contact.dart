import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom-ui/Button_card.dart';
import 'package:whatsapp_clone/custom-ui/Contact_card.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:whatsapp_clone/screens/new_group_page.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {

    List<contact> contacts=[
      contact("Vasu Goel", "Hare Krishna✨"),
      contact("Adi", "Jai Mata Di"),
      contact("Naman", "Never let the kid die inside you...Be curious. Be amazed.Be you"),
      contact("Isra", ""),
      contact("Vama", "Be a candle in the dark"),
    ];
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
            Text("256 Contacts",style: TextStyle(fontSize: 13),),
          ],
        ),actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,),iconSize: 26,),
        PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a Friend"), value: "View contact",),
                PopupMenuItem(child: Text("Contacts"),
                  value: "New broadcast",),
                PopupMenuItem(child: Text("Refresh"), value: "Whatsapp Web",),
                PopupMenuItem(
                  child: Text("Help"), value: "Starred messages",),
              ];
            })
      ],
      ),
      body: ListView.builder(
          itemCount: contacts.length+2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>NewGroup()));
              },
                  child: ButtonCard(name: "New Group", icon: Icons.group));
            }
            else if (index == 1) {
              return ButtonCard(name: "New Contact", icon: Icons.person_add);
            }
            return ContactCard(conts: contacts[index-2],);
          }),
    );
  }
}
