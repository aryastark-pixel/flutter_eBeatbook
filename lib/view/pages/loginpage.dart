//Loginpage aka homepage
//page1
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:e_beatbook/view/widgets/loginwidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Beat-Personnel Login',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 24,
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginWidget(),
                ],
        
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
