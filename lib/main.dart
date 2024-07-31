import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/footer_widget.dart';
import 'otp_verify.dart';
import 'location_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocationService().startLocationService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Center(
            child: Text(
              'eBeatBook',
              style: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Color(0xFFFF7F3E),
          centerTitle: true,
        ),
      ),
      body: Container(
        color: Color(0xFFFFF6E9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 0),
            Image.asset(
              'assets/logo.png',
              height: 350,
            ),
            SizedBox(height: 20),
            Text(
              'Beat Login',
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
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
                  MaterialPageRoute(builder: (context) => OtpVerify()),
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
                'GET OTP',
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
