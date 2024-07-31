import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/footer_widget.dart';
import 'beatbook.dart';
import 'location_provider.dart';

class OtpVerify extends StatefulWidget {
  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  String _otp = '';

  @override
  void initState() {
    super.initState();
    LocationService().startLocationService(); // Start location service
  }

  @override
  void dispose() {
    LocationService().stopLocationService(); // Stop location service
    super.dispose();
  }

  void _verifyOtp() {
    if (_otp == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BeatbookEntry()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: true, // This will show the back button
          centerTitle: true, // Ensures that the title is centered
          title: Text(
            'eBeatBook',
            style: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
          ), // Your title text widget
          backgroundColor: Color(0xFFFF7F3E),
        ),
      ),
      body: Container(
        color: Color(0xFFFFF6E9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
// Adjusted padding to manage space between AppBar and logo
            SizedBox(height: 0), // Adjust height as needed
            Image.asset(
              'assets/logo.png', // Ensure this image is in your assets folder
              height: 350,
            ),
            SizedBox(height: 20),
            Text(
              'Verification',
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BeatbookEntry()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF604CC3),
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'VERIFY',
                style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}