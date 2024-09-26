class categories {
  int? id;
  String? name;

  categories({this.id, this.name});

  categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
