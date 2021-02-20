class BannerModel {
  String key;
  String image;


  BannerModel({this.key,this.image});
  BannerModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    key = map["key"];
    image = map["image"];
  }

  toJson() {
    return {
      'key':	key,'image':image,
    };
  }

  BannerModel copyWith({String NumberId, String key,}) {
    return BannerModel(key:	key	?? this.key	,
        image: image ?? this.image	);
  }


}
