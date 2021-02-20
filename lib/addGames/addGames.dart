import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaderboard/addGames/addGamesProvider.dart';
import 'package:provider/provider.dart';

class AddGames extends StatefulWidget {
  @override
  _AddGamesState createState() => _AddGamesState();
}

class _AddGamesState extends State<AddGames> {
  TextEditingController gameName = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  File _image;

  @override
  Widget build(BuildContext context) {
   var  addGame = Provider.of<AddGamesProvider>(context,listen:false);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Add Game"),
      ),
      body:
     Center(child:  Container(
       color: Colors.black26,
       margin: EdgeInsets.all(10),
       height: 400,
       child: Card(
         color: Colors.amber,
         child: Column(children: [
           SizedBox(height: 15,),
           InkWell(
             child: CircleAvatar(
               radius: 55,
               backgroundColor: Color(0xffFDCF09),
               child: CircleAvatar(
                 radius: 50,
                 backgroundImage:addGame.image == null ? NetworkImage("https://static.toiimg.com/photo/72975551.cms") :FileImage(addGame.image),
               ),
             ),
             onTap: () {
               addGame.getImage();


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
               controller: gameName,
               decoration:  InputDecoration(
                   hintText: "Enter game name"),
               onChanged: (val){
                 addGame.gameName=val;
               },
             ),),),
           SizedBox(height: 40,),
           InkWell(
             child: Container(
               decoration: BoxDecoration(

                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(8),
                       topRight: Radius.circular(8),
                       bottomLeft: Radius.circular(8),
                       bottomRight: Radius.circular(8)),
                   color: Colors.green,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.yellow,
                         blurRadius: 4,
                         spreadRadius: 1,
                         offset: Offset(0, 1)),
                   ]),
               width: 150,
               height: 40,
               child: Center(child: Text("Add Game"),),),
             onTap: () {
              addGame.uploadPic(context: context,scaffoldKey: scaffoldKey,name: addGame.gameName);

               print("------------"+addGame.image.toString());

             },
           ),
         ],),),),)
    );
  }
}
