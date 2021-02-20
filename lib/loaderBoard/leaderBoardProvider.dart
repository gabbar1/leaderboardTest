
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard/model/banner.dart';
import 'package:leaderboard/model/gameModel.dart';

class LeaderBoardProvider extends ChangeNotifier {

  DatabaseReference transRef = FirebaseDatabase.instance.reference();

  var banners = List<BannerModel>();
  var games = List<GamesModel>();
  var bannerList;
  getBanners() {

    transRef.child('banner').once().then((DataSnapshot snapshot) {
      banners.clear();
      List<dynamic> lisData = snapshot.value;
      banners = lisData.map((e) => BannerModel.fromJson(e)).toList();
     notifyListeners();
    });

  }

  getGames() {
    transRef.child('games').once().then((DataSnapshot snapshot) {
      games.clear();
      print("s"+snapshot.value.toString());
      Map<dynamic,dynamic> map = snapshot.value;
      List<dynamic> listGames = map.values.toList();
      games = listGames.map((e) => GamesModel.fromJson(e)).toList();
      print(listGames);
      notifyListeners();
    });

  }
}