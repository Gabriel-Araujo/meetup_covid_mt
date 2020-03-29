// To parse this JSON data, do
//
//     final brazilCases = brazilCasesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class BrazilCases {
    final List<Doc> docs;
    final String publishedIn;
    final String updatedAt;

    BrazilCases({
        @required this.docs,
        @required this.publishedIn,
        @required this.updatedAt,
    });

    factory BrazilCases.fromJson(String str) => BrazilCases.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BrazilCases.fromMap(Map<String, dynamic> json) => BrazilCases(
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromMap(x))),
        publishedIn: json["published_in"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "docs": List<dynamic>.from(docs.map((x) => x.toMap())),
        "published_in": publishedIn,
        "updated_at": updatedAt,
    };
}

class Doc {
    final String state;
    final String cityName;
    final String date;
    final int cases;
    final int cityCod;
    final int stateCod;
    final int count;

    Doc({
        @required this.state,
        @required this.cityName,
        @required this.date,
        @required this.cases,
        @required this.cityCod,
        @required this.stateCod,
        @required this.count,
    });

    factory Doc.fromJson(String str) => Doc.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Doc.fromMap(Map<String, dynamic> json) => Doc(
        state: json["state"],
        cityName: json["city_name"],
        date: json["date"],
        cases: json["cases"],
        cityCod: json["city_cod"] == null ? null : json["city_cod"],
        stateCod: json["state_cod"] == null ? null : json["state_cod"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "state": state,
        "city_name": cityName,
        "date": date,
        "cases": cases,
        "city_cod": cityCod == null ? null : cityCod,
        "state_cod": stateCod == null ? null : stateCod,
        "count": count,
    };
}
