import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:onlinevotingsystem/PersonModel.dart';
import 'package:onlinevotingsystem/classes/disrict.dart';
import 'package:onlinevotingsystem/province.dart';

class Controller {
  Future<List<ProvinceModel>> trigger() async {
    calculateDistricts();
    calculateProvinces();
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "get province"};
    final response = await http.post(Uri.parse(url), body: body);
    var list = json.decode(response.body);
    List<ProvinceModel> parties = await list
        .map<ProvinceModel>((json) => District.fromJson(json))
        .toList();
    return parties;
  }

  resultCheck() async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Result Check"};
    final response = await http.post(Uri.parse(url), body: body);
    var list = json.decode(response.body);
    return list;
  }

  loginCheck(String cnic, String password) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Login Check", "cnic": cnic, "password": password};
    final response = await http.post(Uri.parse(url), body: body);
    print(response.body);
    var list = json.decode(response.body);

    return list;
  }

  vote(String cnic, String party_id) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Voted", "cnic": cnic, "party_id": party_id};
    final response = await http.post(Uri.parse(url), body: body);
    var result = json.decode(response.body);
    print(response.body);
    return result;
  }

  addmna(String mna, String district_id, String party_id) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {
      "service": "Add MNA",
      "MNA": mna,
      "District": district_id,
      "Party": party_id
    };
    final response = await http.post(Uri.parse(url), body: body);
  }

  calculateDistricts() async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {
      "service": "Calculate Districts",
    };
    final response = await http.post(Uri.parse(url), body: body);
    var list = json.decode(response.body);
    List<District> parties =
        await list.map<District>((json) => District.fromJson(json)).toList();
    for (var i = 0; i < list["count"]; i++) {
      calculateMna(list[i]);
    }
  }

  calculateProvinces() async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {
      "service": "Calculate Provinces",
    };
    final response = await http.post(Uri.parse(url), body: body);
    var list = json.decode(response.body);
    List<Province> parties =
        await list.map<Province>((json) => Province.fromJson(json)).toList();
    for (var i = 0; i < list["count"]; i++) {
      calculateLeadingParty(list[i]);
    }
  }

  calculateMna(String district) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Calculate MNA", "district": district};
    final response = await http.post(Uri.parse(url), body: body);
    var mna = json.decode(response.body);
    addmna(mna["Name"], district, mna["winner"]);
  }

  calculateLeadingParty(String province) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Calculate Leading Party", "province": province};
    final response = await http.post(Uri.parse(url), body: body);
    String leading_party = json.decode(response.body);
    addLeadingParty(leading_party, province);
  }

  Future<String> calcuateLeader() async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Winner Party"};
    final response = await http.post(Uri.parse(url), body: body);
    print(response.body);
    String leading_party = response.body;
    print(leading_party);
    return leading_party;
  }

  addLeadingParty(String party, String province_id) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {
      "service": "Add Party",
      "party": party,
      "province": province_id
    };
    final response = await http.post(Uri.parse(url), body: body);
  }

  register(String cnic, String password) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Register", "cnic": cnic, "password": password};
    final response = await http.post(Uri.parse(url), body: body);
    print(response.body);
    var result = json.decode(response.body);
    print(result);
    return result;
  }

  getPersonDetails(String cnic) async {
    var url =
        "http://localhost/onlinevotingsystem/lib/classes/db/dbcontroller.php";
    var body = {"service": "Person Details", "cnic": cnic};
    final response = await http.post(Uri.parse(url), body: body);
    var result = json.decode(response.body);
    PersonModel result1 = PersonModel.fromJson(result[0]);
    print(result1);
    return result1;
  }
}
