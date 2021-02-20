class GamesModel {
  String key;
  String gameImage;
  String gameName;


  GamesModel({this.key,this.gameImage,this.gameName});
  GamesModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    key = map["key"];
    gameImage = map["gameImage"];
    gameName = map["gameName"];
  }

  toJson() {
    return {
      'key':	key,'gameImage':gameImage,"gameName":gameName
    };
  }

  GamesModel copyWith({String NumberId, String key,}) {
    return GamesModel(key:	key	?? this.key	,
        gameImage: gameImage ?? this.gameImage,
        gameName : gameName ?? this.gameName);
  }


}
