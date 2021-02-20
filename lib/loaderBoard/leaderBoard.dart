import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_moolban/flutter_swiper_moolban.dart';
import 'package:leaderboard/addGames/addGames.dart';
import 'package:leaderboard/listPlayers/listPlayers.dart';
import 'package:leaderboard/loaderBoard/leaderBoardProvider.dart';
import 'package:provider/provider.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  void initState() {
    Provider.of<LeaderBoardProvider>(context, listen: false).getBanners();
    Provider.of<LeaderBoardProvider>(context, listen: false).getGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bannerProvider =
        Provider.of<LeaderBoardProvider>(context, listen: true);

    return Consumer<LeaderBoardProvider>(builder: (context,games,child){
      return Scaffold(
        appBar: AppBar(
          title: Text("MyLeaderBoard"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 200,
              child: Swiper(
                autoplay: true,
                itemCount: games.banners.length,
                itemBuilder: (context, snap) {
                  return Image.network(
                    games.banners[snap].image,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Games",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: games.games.length,
                    itemBuilder: (context, snap) {
                      return Column(
                        children: [
                          InkWell(child:  Container(
                            height: MediaQuery.of(context).size.height/16,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.yellow,
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1)),
                                ]),
                            margin: EdgeInsets.all(15),child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffFDCF09),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:games.games[snap].gameImage == null ? NetworkImage("https://static.toiimg.com/photo/72975551.cms") :NetworkImage(games.games[snap].gameImage)),
                            ),
                          ),onTap: (){
                            Navigator.push(context,
                              MaterialPageRoute(
                                ///builder: (context) => LoginPage(),
                                builder: (context) => ListPlayer(game: games.games[snap].gameName,),
                              ),
                            );
                          },),
                          Text(games.games[snap].gameName)
                        ],
                      );
                    },
                  ),
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                //  builder: (context) => new Lottery_fill(phone: uid,amt: transaction['Amount'].toString(),price: transaction['price'].toString(),typ:transaction['Name'] ,ticket_type:transaction['ticket_type'].toString() ,numberofsell:transaction['numberofsell'].toString(),wallet_amount: int.parse(amount1),index1: index,)
                  builder: (context) => AddGames()),
            );
          },
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
      );
    });
  }
}
