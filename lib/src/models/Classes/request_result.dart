// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

RequestResult requestFromJson(String str) => RequestResult.fromJson(json.decode(str));

String requestToJson(RequestResult data) => json.encode(data.toJson());

class RequestResult {
    int code;
    dynamic data;

    RequestResult({
        this.code,
        this.data,
    });

    factory RequestResult.fromJson(Map<String, dynamic> json) => RequestResult(
        code  : json["resultCode"],
        data  : json["data"],
    );

    Map<String, dynamic> toJson() => {
        "code"  : code,
        "data"  : data,
    };
}
