/// name : "Harry Potter"
/// city : "London"

class PostModel2 {
  PostModel2({
      String? name, 
      String? city,}){
    _name = name;
    _city = city;
}

  PostModel2.fromJson(dynamic json) {
    _name = json['name'];
    _city = json['city'];
  }
  String? _name;
  String? _city;
PostModel2 copyWith({  String? name,
  String? city,
}) => PostModel2(  name: name ?? _name,
  city: city ?? _city,
);
  String? get name => _name;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['city'] = _city;
    return map;
  }

}