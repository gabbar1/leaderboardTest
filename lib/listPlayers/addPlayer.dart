import 'package:flutter/material.dart';
import 'package:leaderboard/listPlayers/listPlayerProvider.dart';
import 'package:provider/provider.dart';

class AddPlayer extends StatefulWidget {
  String game;
  AddPlayer({this.game});
  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var  addPlayer = Provider.of<ListPlayerProvider>(context,listen:false);
   return Scaffold(
     key: scaffoldKey,
     appBar: AppBar(title: Text('Add Player'),),body: Center(child:  Container(
     color: Colors.black26,
     margin: EdgeInsets.all(10),
     height: 400,
     child: Card(
       color: Colors.deepPurpleAccent,
       child: Column(children: [
         SizedBox(height: 15,),
         InkWell(
           child: CircleAvatar(
             radius: 55,
             backgroundColor: Color(0xffFDCF09),
             child: CircleAvatar(
               radius: 50,
               backgroundImage:addPlayer.image == null ? NetworkImage("https://static.toiimg.com/photo/72975551.cms") :FileImage(addPlayer.image),
             ),
           ),
           onTap: () {
             addPlayer.getImage();
           },
         ),
         SizedBox(height: 15,),
         Center(child:  Container(
           decoration: BoxDecoration(

               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(8),
                   topRight: Radius.circular(8),
                   bottomLeft: Radius.circular(8),
                   bottomRight: Radius.circular(8)),
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                     color: Colors.yellow,
                     blurRadius: 4,
                     spreadRadius: 1,
                     offset: Offset(0, 1)),
               ]),
           width: MediaQuery.of(context).size.width-50,
           child: TextField(

             decoration:  InputDecoration(
                 hintText: "Enter Player name"),
             onChanged: (val){
               addPlayer.playerName=val;
             },
           ),),),
         SizedBox(height: 15,),
         Center(child:  Container(
           decoration: BoxDecoration(

               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(8),
                   topRight: Radius.circular(8),
                   bottomLeft: Radius.circular(8),
                   bottomRight: Radius.circular(8)),
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                     color: Colors.yellow,
                     blurRadius: 4,
                     spreadRadius: 1,
                     offset: Offset(0, 1)),
               ]),
           width: MediaQuery.of(context).size.width-50,
           child: TextField(
             keyboardType: TextInputType.phone,
             decoration:  InputDecoration(
                 hintText: "Enter Score"),
             onChanged: (val){
               addPlayer.playerScore=val;
             },
           ),),),
         SizedBox(height: 15,),
         Center(child:  Container(
           decoration: BoxDecoration(

               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(8),
                   topRight: Radius.circular(8),
                   bottomLeft: Radius.circular(8),
                   bottomRight: Radius.circular(8)),
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                     color: Colors.yellow,
                     blurRadius: 4,
                     spreadRadius: 1,
                     offset: Offset(0, 1)),
               ]),
           width: MediaQuery.of(context).size.width-50,
           child: TextField(
             keyboardType: TextInputType.phone,
             decoration:  InputDecoration(
                 hintText: "Enter Rank"),
             onChanged: (val){
               addPlayer.playerRank=val;
             },
           ),),),
         SizedBox(height: 10,),
         InkWell(
           child: Container(
             decoration: BoxDecoration(

                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(8),
                     topRight: Radius.circular(8),
                     bottomLeft: Radius.circular(8),
                     bottomRight: Radius.circular(8)),
                 color: Colors.purple,
                 boxShadow: [
                   BoxShadow(
                       color: Colors.yellow,
                       blurRadius: 4,
                       spreadRadius: 1,
                       offset: Offset(0, 1)),
                 ]),
             width: 150,
             height: 40,
             child: Center(child: Text("Add Player"),),),
           onTap: () {
             addPlayer.updatePlayers(context: context,scaffoldKey: scaffoldKey,game: widget.game,playerName: addPlayer.playerName,playerScore: addPlayer.playerScore,playerRank:addPlayer.playerRank);
             addPlayer.playerCount(widget.game);


           },
         ),
       ],),),),),);
  }
}
