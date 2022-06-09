class ProvinceModel {
  String? province_name;
  String? p_id;
  String? leading_party;
  int? total_seats;
  ProvinceModel(
      {this.province_name, this.p_id, this.leading_party, this.total_seats});
  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
        p_id: json['party_id'] as String,
        province_name: json['party_name'] as String,
        leading_party: json['leader_name'] as String,
        total_seats: int.parse(json['win_status']));
  }
  void calculateLead() {}
}
