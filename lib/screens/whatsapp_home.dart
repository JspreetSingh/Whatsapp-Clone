import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:whatsapp_clone/pages/Chat_page.dart';
import 'package:whatsapp_clone/pages/camera.dart';

class WhatsappHome extends StatefulWidget {
  const WhatsappHome({Key? key,required this.chats,required this.chatSource}) : super(key: key);
  final List<chatModel> chats;
  final chatModel chatSource;

  @override
  State<WhatsappHome> createState() => _WhatsappHomeState();
}

class _WhatsappHomeState extends State<WhatsappHome>with SingleTickerProviderStateMixin {
  late TabController controller;

  void initState(){
    super.initState();
    controller = TabController(length: 4,vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text("WhatsApp"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context){
            return[
            PopupMenuItem(child: Text("New group"),value: "New group",),
              PopupMenuItem(child: Text("New broadcast"),value: "New broadcast",),
              PopupMenuItem(child: Text("Whatsapp Web"),value: "Whatsapp Web",),
              PopupMenuItem(child: Text("Starred messages"),value: "Starred messages",),
              PopupMenuItem(child: Text("Settings"),value: "Settings",),
            ];
          })
        ],
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "CHATS",),
            Tab(text: "STATUS",),
            Tab(text: "CALLS",),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Camera(),
          Chatpage(chats: widget.chats,chatSource: widget.chatSource,),
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}
