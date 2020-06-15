
import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedules{
  List<Schedule> schedules = new List();
  Schedules();
  Schedules.fromJsnList(List<dynamic> jsonList){
    if(jsonList==null) return;
    for(var item in jsonList){
      final schedule = new Schedule.fromJson(item);
      schedules.add(schedule);
    }
  }
}

class Schedule {
  int id;
  int clubId;
  String openingTime;
  String closingTime;
  String day;

  Schedule({
    this.id,
    this.clubId,
    this.openingTime,
    this.closingTime,
    this.day,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id          : json["id"],
    clubId      : json["clubId"],
    openingTime : json["openingTime"],
    closingTime : json["closingTime"],
    day         : json["day"],
  );

  Map<String, dynamic> toJson() => {
    "id"          : id,
    "clubId"      : clubId,
    "openingTime" : openingTime,
    "closingTime" : closingTime,
    "day"         : day,
  };
}