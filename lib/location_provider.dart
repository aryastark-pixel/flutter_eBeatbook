import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  Timer? _timer;
  Position? _currentPosition;

  void startLocationService() {
    _getLocationPeriodically();
  }

  void _getLocationPeriodically() async {
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      _getCurrentLocationAndSend();
    });
  }

  Future<void> _getCurrentLocationAndSend() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      if (_currentPosition != null) {
        await _sendLocation(_currentPosition!);
      }
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  Future<void> _sendLocation(Position position) async {
    final url = Uri.parse('http://10.182.2.184:8000/api/location/');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'user_id': '12345', // Replace with actual user ID
          'latitude': position.latitude,
          'longitude': position.longitude,
        }),
      );

      if (response.statusCode == 200) {
        print('Location sent successfully');
      } else {
        print('Failed to send location');
      }
    } catch (e) {
      print('Error sending location: $e');
    }
  }

  void stopLocationService() {
    _timer?.cancel();
    _timer = null;
  }
}
