import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard/loaderBoard/leaderBoardProvider.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'addGames/addGamesProvider.dart';
import 'listPlayers/listPlayerProvider.dart';
import 'loaderBoard/leaderBoard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  runApp(
      MultiProvider(providers:[
        ChangeNotifierProvider<LeaderBoardProvider>(create: (_) => LeaderBoardProvider()),
        ChangeNotifierProvider<AddGamesProvider>(create: (_) => AddGamesProvider()),
        ChangeNotifierProvider<ListPlayerProvider>(create: (_) => ListPlayerProvider()),

      ],
          child: MyApp()

      ),
      );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LeaderBoard',
      theme: ThemeData(primaryColor: Colors.amber ,
          accentColor:  Colors.amber),
      home: SplashScreen(seconds: 5,
      navigateAfterSeconds: LeaderBoard(),
      title: new Text('Welcome to MyLeaderBoard',
        style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
      ),

      //  backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.amber,
      styleTextUnderTheLoader: new TextStyle(),

      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red,
    )
    );
  }
}


