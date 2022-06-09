import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Province {
  String? province_id;
  Province({this.province_id});
  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(province_id: json['party_id'] as String);
  }
}

class ProvinceModel {
  String? province_id;
  String? province_name;
  String? leading_party;
  ProvinceModel({this.province_id, this.province_name, this.leading_party});
  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
        province_id: json['party_id'] as String,
        province_name: json['party_name'] as String,
        leading_party: json['leading_party'] as String);
  }
}
