
import 'dart:convert';

Promotion promotionFromJson(String str) => Promotion.fromJson(json.decode(str));

String promotionToJson(Promotion data) => json.encode(data.toJson());


class Promotions{
  List<Promotion> promos = new List();
  Promotions();
  Promotions.fromJsnList(List<dynamic> jsonList){
    if(jsonList==null) return;
    for(var item in jsonList){
      final promo = new Promotion.fromJson(item);
      promos.add(promo);
    }
 
  }
}


class Promotion{
  int id;
  int clubId;
  String name;
  String description;
  String coverUrl;
  double discount;

  Promotion({
    this.id,
    this.clubId,
    this.name,
    this.description,
    this.coverUrl,
  });


  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
    id: json["id"],
    clubId: json["clubId"],
    name: json["name"],
    description: json["description"],
    coverUrl: json["coverUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id"              : id,
    "clubId"          : clubId,
    "name"            : name,
    "description"     : description,
    "coverUrl"        : coverUrl,

  };


  @override
  String toString() {
    return 'Promotion{id: $id, name: $name, description: $description, coverUrl: $coverUrl, discount: $discount}';
  }


}