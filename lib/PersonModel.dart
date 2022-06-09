import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PersonModel {
  String? name;
  String? identity_number;
  String? district;
  int? vote_status;
  PersonModel(
      {this.name, this.identity_number, this.district, this.vote_status});
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        name: json['Name'] as String,
        identity_number: json['identity_number'] as String,
        district: json['district_name'] as String,
        vote_status: int.parse(json['vote_status']));
  }
}
