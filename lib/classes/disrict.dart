import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class District {
  String? district_id;
  District({this.district_id});
  factory District.fromJson(Map<String, dynamic> json) {
    return District(district_id: json['party_id'] as String);
  }
}
