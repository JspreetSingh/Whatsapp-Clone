import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
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
  var isEmojiVisible=false;
  FocusNode focusNode=FocusNode();
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
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
              ListView(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 78,
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
                                          onPressed: () {},
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
                          backgroundColor: Color(0xFF075E54), radius: 20,
                          child: IconButton(
                            color: Color(0xFFFFFFFF), icon: Icon(Icons.mic),
                            onPressed: () {},),
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
    );
  }
}

