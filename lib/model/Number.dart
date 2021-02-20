class Number {
  String key;
  int count;
  Number({this.key, this.count});
  Number.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    key = map['key'];
    count = map['count'];
  }

  toJson() {
    return {
      'key': key,
      'count':count
    };
  }

  Number copyWith({String countId, String key,}) {
    return Number(count: count ?? this.count);
  }


}
