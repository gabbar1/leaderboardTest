class PlayerModel {
  String key;
  String playerImage;
  String playerName;
  String playerScore;
  String playerRank;


  PlayerModel({this.key,this.playerImage,this.playerName,this.playerScore,this.playerRank});
  PlayerModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    key = map["key"];
    playerImage = map["playerImage"];
    playerName = map["playerName"];
    playerScore = map["playerScore"];
    playerRank = map["playerRank"];
  }

  toJson() {
    return {
      'key':	key,'playerImage':playerImage,"playerName":playerName,"playerScore":playerScore,"playerRank":playerRank
    };
  }

  PlayerModel copyWith({String NumberId, String key,}) {
    return PlayerModel(key:	key	?? this.key	,
        playerImage: playerImage ?? this.playerImage,
        playerName : playerName ?? this.playerName,
      playerRank : playerRank ?? this.playerRank,
      playerScore : playerScore ?? this.playerScore,);
  }


}
