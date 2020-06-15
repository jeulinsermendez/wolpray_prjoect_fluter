import 'dart:convert';

import 'Product.dart';
import 'ReservClass.dart';
import 'Schedule.dart';
import 'TableDisc.dart';


Club clubFromJson(String str) => Club.fromJson(json.decode(str));

String clubToJson(Club data) => json.encode(data.toJson());

class Clubs{
  List<Club> clubs = new List();
  Clubs();
  Clubs.fromJsnList(List<dynamic> jsonList){
    if(jsonList==null) return;
    for(var item in jsonList){
      final club = new Club.fromJson(item);
      clubs.add(club);
    }
  }
}

class Club {
  int id;
  String name = '';
  String streetName = '';
  int streetNumber;
  String postalCode = '';
  String city = '';
  String description = '';
  String ambience = '';
  String phone = '';
  String dressCode = '';
  String coverUrl = '';
  List<Schedule> schedule;
  List<TableDisc> tableList;
  List<Reserv> reservationList;
  List<Product> productList;





  Club({
    this.id,
    this.name,
    this.streetName,
    this.streetNumber,
    this.postalCode,
    this.city,
    this.description,
    this.ambience,
    this.phone,
    this.dressCode,
    this.coverUrl,
    this.schedule,
    this.tableList,
    this.reservationList,
    this.productList,
  });


  factory Club.fromJson(Map<String, dynamic> json) => Club(
    id                : json["id"],
    name              : json["name"],
    streetName        : json["streetName"],
    streetNumber      : json["streetNumber"],
    postalCode        : json["postalCode"],
    city              : json["city"],
    description       : json["description"],
    ambience          : json["ambience"],
    phone             : json["phone"],
    dressCode         : json["dressCode"],
    coverUrl          : json["coverUrl"],
    schedule          : List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
    tableList         : List<TableDisc>.from(json["tableList"].map((x) => TableDisc.fromJson(x))),
    reservationList   : List<Reserv>.from(json["reservationList"].map((x) => Reserv.fromJson(x))),
    productList       : List<Product>.from(json["productList"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id"              : id,
    "name"            : name,
    "streetName"      : streetName,
    "streetNumber"    : streetNumber,
    "postalCode"      : postalCode,
    "city"            : city,
    "description"     : description,
    "ambience"        : ambience,
    "phone"           : phone,
    "dressCode"       : dressCode,
    "schedule"        : List<Schedule>.from(schedule.map((x) => x.toJson())),
    "tableList"       : List<TableDisc>.from(tableList.map((x) => x.toJson())),
    "reservationList" : List<Reserv>.from(reservationList.map((x) => x.toJson())),
    "productList"     : List<Product>.from(productList.map((x) => x.toJson())),
  };
}


