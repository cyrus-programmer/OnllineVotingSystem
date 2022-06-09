import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PartyModel {
  String? party_id;
  String? partyName;
  String? leaderName;
  int? winStatus;
  PartyModel({this.party_id, this.partyName, this.leaderName, this.winStatus});
  factory PartyModel.fromJson(Map<String, dynamic> json) {
    return PartyModel(
        party_id: json['party_id'] as String,
        partyName: json['party_name'] as String,
        leaderName: json['leader_name'] as String,
        winStatus: int.parse(json['win_status']));
  }
}
