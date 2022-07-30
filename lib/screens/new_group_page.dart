import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom-ui/Button_card.dart';
import 'package:whatsapp_clone/custom-ui/Contact_card.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({Key? key}) : super(key: key);

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  @override
  Widget build(BuildContext context) {

    List<contact> contacts=[
      contact("Vasu Goel",  "Hare Krishna✨",select:false),
      contact( "Adi",  "Jai Mata Di",select: true ),
      contact( "Naman",  "Never let the kid die inside you...Be curious. Be amazed.Be you",),
      contact( "Isra",  "", ),
      contact( "Vama",  "Be a candle in the dark",),
    ];


    List<contact> groups=[];
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Group",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
            Text("Add Participant",style: TextStyle(fontSize: 13),),
          ],
        ),actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,),iconSize: 26,),
      ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return InkWell(onTap:(){
              if(contacts[index].select==false)
                {
                  setState(() {
                    contacts[index].select=true;
                    groups.add(contacts[index]);
                    print(groups.length);
                  });
                }

              else
                {
                  setState(() {
                    contacts[index].select=false;
                    groups.remove(contacts[index]);
                    //print(groups);
                  });
                }
            },child: ContactCard(conts: contacts[index],));
          }),
    );
  }
}
