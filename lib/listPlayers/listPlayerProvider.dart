
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaderboard/loaderBoard/leaderBoard.dart';
import 'package:leaderboard/model/Number.dart';
import 'package:leaderboard/model/playerModel.dart';

class ListPlayerProvider extends ChangeNotifier  {
  DatabaseReference transRef = FirebaseDatabase.instance.reference();
  File image;
  var playersList = List<PlayerModel>();
  final picker = ImagePicker();
  String playerName;
  String playerScore;
  String playerRank;
  int count ;
  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    image = File(pickedFile.path);
    notifyListeners();
  }
  getPlayers(String game) {
    transRef.child('players').child(game).once().then((DataSnapshot snapshot) {
      playersList.clear();
      print("s"+snapshot.value.toString());
      Map<dynamic,dynamic> map = snapshot.value;
      if(snapshot.value != null){
        List<dynamic> listPlayer = map.values.toList();
        playersList = listPlayer.map((e) => PlayerModel.fromJson(e)).toList();
        print(listPlayer);
        notifyListeners();
      }

    });

  }
 
  playerCount(String game) {
    transRef.child('playersCount').child(game).once().then((DataSnapshot snapshot) {
      var numbers =
      Number.fromJson(snapshot.value);
      if(numbers.count == null){
        count = 0;
      }
      else {
        count  = numbers.count;
      }
      notifyListeners();
    });

  }

  Future  updatePlayers({String playerRank,String game,String playerName,String playerScore, GlobalKey<ScaffoldState> scaffoldKey,BuildContext context}) async{
    StorageReference firebaseStorage =
    FirebaseStorage.instance.ref()..child(game).child(playerName);
    StorageUploadTask uploadTask = firebaseStorage.child(game).child(playerName).putFile(image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    transRef.child('players').child(game).push().update({
      "playerName":playerName,
      "playerImage":downloadUrl,
      "playerScore": playerScore,
      "playerRank": playerRank,
      "time": DateTime.now().toString()

    });
    transRef.child('playersCount').child(game).update({
      'count':count+1
    });
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Player Added successfully...",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold)),
    ));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
        LeaderBoard()), (Route<dynamic> route) => false);
  }
}