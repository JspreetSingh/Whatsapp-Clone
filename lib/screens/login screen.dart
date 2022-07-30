import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom-ui/Button_card.dart';
import 'package:whatsapp_clone/screens/whatsapp_home.dart';

import '../model/chat_model.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late chatModel chatSource;
  List<chatModel>chats = [
    chatModel("Vaibhav","person_black_36dp.svg", "Hi Vaibhav!! How r u", false, "14:39",1),
    chatModel("Agam", "person_black_36dp.svg", "Hlo Agam ", false, "2:40",2),
    chatModel("Papa", "person_black_36dp.svg", "Hlo papa ", false, "5:40",3),
    chatModel("Mom", "person_black_36dp.svg", "Hlo mom ", false, "1:45",4),
    chatModel("Vama", "person_black_36dp.svg", "Hlo vama ", false, "11:09",5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              chatSource=chats.removeAt(index);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                      builder: (builder)=>WhatsappHome(
                        chats: chats,
                        chatSource: chatSource,
                      )));
            },
            child: ButtonCard(name: chats[index].name, icon: Icons.person,
                ),
          )));
  }
}
