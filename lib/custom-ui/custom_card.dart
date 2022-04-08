import 'package:flutter/material.dart';

class Customcard extends StatelessWidget {
  const Customcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
      ),
      title: Text("Vaibhav",style: TextStyle(
        fontSize: 16,fontWeight: FontWeight.bold
      ),),
      subtitle: Text("Hi Vaibhav",style: TextStyle(
        fontSize: 13
      ),),
      trailing: Text("23:13"),
    );
  }
}
