
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leaderboard/loaderBoard/leaderBoard.dart';

class AddGamesProvider extends ChangeNotifier{

  final DBRef = FirebaseDatabase.instance.reference();
File image;
String gameName;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
      image = File(pickedFile.path);
      notifyListeners();
  }


  Future uploadPic(
      {BuildContext context,
      String name,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    StorageReference firebaseStorage =
    FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = firebaseStorage.child(name).putFile(image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    DBRef.child("games").child(name).update({
      'gameImage': downloadUrl,
      'gameName':gameName
    });
        print("Uploaded");
        print(downloadUrl);

        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Game has been added...",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold)),
        ));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
        LeaderBoard()), (Route<dynamic> route) => false);

    }
  }

