class chatModel{
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;

  chatModel(this.name,this.icon,this.currentMessage,this.isGroup,this.time,);
}

class contact{
  String name;
  String status;
  bool select=false;

  contact( this.name, this.status, {bool select=false});

}

class contact1{
  bool select=false;

  contact1({this.select=false});

}