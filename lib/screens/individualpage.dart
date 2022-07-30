import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/custom-ui/reply.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

import '../custom-ui/own_message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class individualpage extends StatefulWidget {
  const individualpage({Key? key,required this.chat,required this.chatSource}) : super(key: key);
  final chatModel chat;
  final chatModel chatSource;

  @override
  State<individualpage> createState() => _individualpageState();
}

class _individualpageState extends State<individualpage> {
  var isEmojiVisible=false;
  FocusNode focusNode=FocusNode();
  late IO.Socket socket;
  bool sendButton=false;

  TextEditingController controller=TextEditingController();

  void initState(){
   super.initState();
   focusNode.addListener(() {
     if(focusNode.hasFocus)
       {
         setState(() {
           isEmojiVisible=false;
         });
       }
   });
   connect();
  }


  void connect(){
    socket=IO.io("http://192.168.1.38:5000",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false,
    });
    socket.connect();
    socket.onConnect((data) => print("Connected"));
    print(socket.connected);
    socket.emit("signin",widget.chatSource.id);
  }

  void sendMessage(String message,int sourceId,int targetId){
    socket.emit("message",
    {
      "message":message, "sourceId":sourceId, "targetId":targetId
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/background_img.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 70,
            backgroundColor: Color(0xFF075E54),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, size: 24,),
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                      child: SvgPicture.asset(widget.chat.isGroup
                          ? 'assets/groups_black_36dp.svg'
                          : 'assets/person_black_36dp.svg', color: Colors.white,
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
                    Text(widget.chat.name, style: TextStyle(
                        fontSize: 18.5, fontWeight: FontWeight.bold),),
                    Text(widget.chat.time, style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.normal),)
                  ],),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
              PopupMenuButton<String>(
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Text("View contact"), value: "View contact",),
                      PopupMenuItem(child: Text("Media,links and docs"),
                        value: "New broadcast",),
                      PopupMenuItem(child: Text("Search"), value: "Whatsapp Web",),
                      PopupMenuItem(
                        child: Text("Mute"), value: "Starred messages",),
                      PopupMenuItem(child: Text("Wallpaper"), value: "Settings",),
                    ];
                  })
            ],
          ),
          body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height-150,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                        ownmessage(),
                        reply(),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 55,
                            child: Card(
                                margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextFormField(
                                  controller: controller,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  minLines: 1,
                                  maxLines: 5,
                                  onChanged: (value){
                                    if(value.length>0){
                                      setState(() {
                                        sendButton=true;
                                      });
                                    }
                                    else{
                                      setState(() {
                                        sendButton=false;
                                      });
                                    }
                                  },
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: IconButton(color: Color(0xFF075E54),
                                        icon: (Icon(Icons.emoji_emotions_rounded)),
                                        onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus=false;
                                        setState(() {
                                          isEmojiVisible=!isEmojiVisible;
                                        });
                                        },),
                                      hintText: "Message",
                                      suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(color: Color(0xFF075E54),
                                              icon: (Icon(Icons.attach_file)),
                                              onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:Colors.transparent,
                                                  context: context, builder: (builder)=>bottomsheet());
                                              },
                                            ),
                                            IconButton(color: Color(0xFF075E54),
                                              icon: (Icon(Icons.camera_alt)),
                                              onPressed: () {},
                                            )
                                          ]
                                      )
                                  ),
                                )),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, left: 2),
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF075E54), radius: 25,
                              child: IconButton(
                                color: Color(0xFFFFFFFF), icon: Icon(sendButton?Icons.send:Icons.mic),
                                onPressed: () {
                                  if(sendButton)
                                    {
                                      sendMessage(controller.text, widget.chatSource.id, widget.chat.id);
                                      controller.clear();
                                    }
                                },),
                            ),
                          ),
                        ],
                      ),
                      isEmojiVisible?Offstage(
                        offstage: false,
                        child: SizedBox(
                          height: 250,
                          child: EmojiPicker(
                              onEmojiSelected: (Category category, Emoji emoji) {
                                print(emoji);
                                setState(() {
                                  controller.text=controller.text+emoji.emoji;
                                });
                              },
                              onBackspacePressed: (){
                                controller.text=controller.text.characters.skipLast(1).toString();
                              },
                              config: Config(
                                  columns: 7,
                                  // Issue: https://github.com/flutter/flutter/issues/28894
                                  emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                                  verticalSpacing: 0,
                                  horizontalSpacing: 0,
                                  initCategory: Category.SMILEYS,
                                  bgColor: const Color(0xFFF2F2F2),
                                  indicatorColor: Colors.blue,
                                  iconColor: Colors.grey,
                                  iconColorSelected: Colors.blue,
                                  progressIndicatorColor: Colors.blue,
                                  backspaceColor: Colors.blue,
                                  skinToneDialogBgColor: Colors.white,
                                  skinToneIndicatorColor: Colors.grey,
                                  enableSkinTones: true,
                                  showRecentsTab: true,
                                  recentsLimit: 28,
                                  noRecentsText: 'No Recents',
                                  noRecentsStyle: const TextStyle(
                                      fontSize: 18, color: Colors.black26),
                                  tabIndicatorAnimDuration: kTabScrollDuration,
                                  categoryIcons: const CategoryIcons(),
                                  buttonMode: ButtonMode.MATERIAL)),
                        ),
                      ):Container(),
                    ],
                  )
                ],
              ),

              onWillPop: (){
                if(isEmojiVisible){
                  setState(() {
                    isEmojiVisible=false;
                  });
                }
                else
                  {
                    Navigator.pop(context);
                  }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget bottomsheet(){
    return Container(
      margin: EdgeInsetsDirectional.all(6),
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconreaction(Icons.insert_drive_file,Colors.deepPurpleAccent,"Document"),
                SizedBox(width: 40,),
                iconreaction(Icons.camera_alt,Colors.pink,"Camera"),
                SizedBox(width: 40,),
                iconreaction(Icons.insert_photo,Colors.purpleAccent,"Gallery"),
              ],
            ),
            SizedBox(height: 28,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconreaction(Icons.audio_file,Colors.deepOrange,"Audio"),
                SizedBox(width: 40,),
                iconreaction(Icons.location_on,Colors.green,"Location"),
                SizedBox(width: 40,),
                iconreaction(Icons.person,Colors.indigo,"Contact"),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget iconreaction(IconData icon,Color color,String text){
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: IconButton(onPressed: () {  }, icon: Icon(icon,size: 25,color: Colors.white,
          ),),
        ),
        Text(text),
      ],
    );
  }
}

