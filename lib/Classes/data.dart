// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.lastUpdateId,
    required this.bids,
    required this.asks,
  });

  int lastUpdateId;
  List<List<String>> bids;
  List<List<String>> asks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    lastUpdateId: json["lastUpdateId"],
    bids: List<List<String>>.from(json["bids"].map((x) => List<String>.from(x.map((x) => x)))),
    asks: List<List<String>>.from(json["asks"].map((x) => List<String>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "lastUpdateId": lastUpdateId,
    "bids": List<dynamic>.from(bids.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "asks": List<dynamic>.from(asks.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
