
import 'dart:convert';

Reserv reservFromJson(String str) => Reserv.fromJson(json.decode(str));

String reservToJson(Reserv data) => json.encode(data.toJson());

class Reservs{
  List<Reserv> reservs = new List();
  Reservs();

  Reservs.fromJsnList(List<dynamic> jsonList){
    if(jsonList==null) return;
    for(var item in jsonList){
      final reserv = new Reserv.fromJson(item);
      reservs.add(reserv);
    }
  }

}


class Reserv {
  int tableId;
  int clubId;
  int userId;
  String date;

  Reserv({int tableId, int clubId, int userId, String date}){
    this.tableId = tableId;
    this.clubId = clubId;
    this.userId = userId;
    this.date = date;
  }

  factory Reserv.fromJson(Map<String, dynamic> json) => Reserv(
    tableId   : json["tableId"],
    clubId    : json["clubId"],
    userId    : json["userId"],
    date      : json["date"],
  );

  Map<String, dynamic> toJson() => {
    "tableId" : tableId,
    "clubId"  : clubId,
    "userId"  : userId,
    "date"    : date,
  };
}