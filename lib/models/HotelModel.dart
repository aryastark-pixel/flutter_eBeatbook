class HotelModel{
  final int id;
  final String HotelName;
  final String HotelOwner;
  final String phonenumber;
  final String Remarks;

  HotelModel({
    required this.id,
    required this.HotelName,
    required this.HotelOwner,
    required this.phonenumber,
    required this.Remarks,

});

factory HotelModel.fromJson(Map<String, dynamic> json) {
return HotelModel(
  id: json['id'] as int,
  HotelName: json['HotelName'] as String,
  HotelOwner: json['HotelOwner'] as String,
  phonenumber: json['phonenumber'] as String,
  Remarks: json['Remarks'] as String,
);
}

static List<HotelModel> fromJsonList(List<dynamic> jsonList) {
return jsonList.map((json) => HotelModel.fromJson(json)).toList();
}

}