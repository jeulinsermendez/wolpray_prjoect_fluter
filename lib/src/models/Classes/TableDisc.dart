import 'package:flutter/material.dart';
import 'dart:convert';

TableDisc tableFromJson(String str) => TableDisc.fromJson(json.decode(str));

String tableToJson(TableDisc data) => json.encode(data.toJson());



class TableDiscs{
  List<TableDisc> tables = new List();
  TableDiscs();

  TableDiscs.fromJsnList(List<dynamic> jsonList){
    if(jsonList==null) return;
    for(var item in jsonList){
      final tableDisc = new TableDisc.fromJson(item);
      tables.add(tableDisc);
    }
  }

}

class TableDisc {
  int id;
  int num;
  bool vip;
  bool reserved;

  TableDisc({
    this.id,
    this.num,
    this.vip,
    this.reserved,
  });

  factory TableDisc.fromJson(Map<String, dynamic> json) => TableDisc(
    id: json["id"],
    num: json["num"],
    vip: json["vip"],
    reserved: json["reserved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "num": num,
    "vip": vip,
    "reserved": reserved,
  };



  Widget getIcon(bool isSelected){
    if(isSelected){
      return Icon(Icons.remove);
    }else{
      return Icon(Icons.add);
    }
    
  }
}