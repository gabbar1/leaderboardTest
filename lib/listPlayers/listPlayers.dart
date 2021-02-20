import 'package:flutter/material.dart';
import 'package:leaderboard/listPlayers/listPlayerProvider.dart';
import 'package:provider/provider.dart';

import 'addPlayer.dart';

class ListPlayer extends StatefulWidget {
  String game;
  ListPlayer({this.game});
  @override
  _ListPlayerState createState() => _ListPlayerState();
}

class _ListPlayerState extends State<ListPlayer> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    Provider.of<ListPlayerProvider>(context, listen: false).getPlayers(widget.game);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final listPlayer =
    Provider.of<ListPlayerProvider>(context, listen: true);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Players"),
      ),
      body:  Align(alignment: Alignment.topCenter,
        child: listPlayer.playersList.length !=0 ?
        ListView.builder(
            itemCount: listPlayer.playersList.length,
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (context, snapshot) {

              // print("-------deadline----------"+vm.daily_ticket[snapshot].deadline.toString());

              return InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text("LeaderBoard",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                  Spacer(),

                                ],
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Color(0xffFDCF09),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:listPlayer.playersList[snapshot].playerImage == null ? NetworkImage("https://static.toiimg.com/photo/72975551.cms") :NetworkImage(listPlayer.playersList[snapshot].playerImage),
                                    ),
                                  ),
                                 Spacer(),
                                 Center(child:  Text(
                                   listPlayer.playersList[snapshot].playerName ,
                                   style: TextStyle(

                                       fontSize: 20,
                                       color: Colors.amber,
                                       fontWeight: FontWeight.bold),
                                 ),),
                                  SizedBox(width: 50,)
                                ],
                              ),

                              Divider(
                                thickness: 1,
                              ),
                              Row(children: [
                                Text("Score : "+
                                  listPlayer.playersList[snapshot].playerScore ,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text("#Rank : "+
                                    listPlayer.playersList[snapshot].playerRank ,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                )
                              ],)

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              );
            }): Center(child: Text("No Player found"),),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listPlayer.playerCount(widget.game);
          Navigator.of(context).push(
              listPlayer.count >= 10 ? scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("maximum 10 Players allowed...",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              )):
            MaterialPageRoute(
              //  builder: (context) => new Lottery_fill(phone: uid,amt: transaction['Amount'].toString(),price: transaction['price'].toString(),typ:transaction['Name'] ,ticket_type:transaction['ticket_type'].toString() ,numberofsell:transaction['numberofsell'].toString(),wallet_amount: int.parse(amount1),index1: index,)
                builder: (context) => AddPlayer(game: widget.game,)),
          );
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
