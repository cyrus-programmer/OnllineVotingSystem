import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onlinevotingsystem/PartyModel.dart';

class Party {
  Future<List<PartyModel>> getPartyDetails() async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Party Details"};
    final response = await http.post(Uri.parse(url), body: body);
    // print(response.body);
    var list = json.decode(response.body);
    List<PartyModel> parties = await list
        .map<PartyModel>((json) => PartyModel.fromJson(json))
        .toList();
    return parties;
  }
}
