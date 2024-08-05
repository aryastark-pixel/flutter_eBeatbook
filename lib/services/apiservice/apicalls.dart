import 'dart:convert';
import 'package:e_beatbook/models/HotelModel.dart';
import 'package:http/http.dart' as http;



Future<List<HotelModel>> fetchHotelList() async {
  var apiUrl = 'http://10.182.2.189:8888/hotels/';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData.toString());
      return HotelModel.fromJsonList(jsonData);
    }
    else {
      throw Exception('Failed to fetch data');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }


}

Future<int> posthotelData(Map<String, dynamic> dataToSend) async {
  var apiUrl = 'http://10.182.2.189:8888/hotels/post/';
  print(apiUrl);
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(dataToSend),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData.toString());
      return  response.statusCode;
    }
    else {
      print ('Updated succesfully');
      final jsonData = json.decode(response.body);
      print(jsonData.toString());
      return response.statusCode;

    }

  } catch (error) {
    throw Exception('Error: $error');
  }

}




