import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key,required this.conts}) : super(key: key);
  final contact conts;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 52,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset("assets/person_black_36dp.svg",color: Colors.white,height: 30,width: 30 ),
              backgroundColor: Colors.blueGrey,
            ),
            conts.select? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 11,
                  child: Icon(Icons.check,color: Colors.white,size: 18,)),
            ) : Container()
          ],
        ),
      ),
      title: Text(conts.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      subtitle: Text(conts.status,style: TextStyle(fontSize: 13),),
    );
  }
}
