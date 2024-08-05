//all the widgets of loginpage
//page 1 widget1
import 'package:e_beatbook/view/pages/beatLoggedin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class CustomAppbar extends StatelessWidget implements
    PreferredSizeWidget {
  const CustomAppbar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),

            )
        ),
        title: Center(child: Text('e-beatbook',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
        primary: true,
        backgroundColor: Color(0xFF2282C3),
        iconTheme: IconThemeData(color: Colors.white)

    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          Container(
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Offset of the shadow
                ),

              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormFields(),
                  ),
                  Captcha(),
                ],
              ),
            ),

          ),

        ],
      ),


    );
  }
}
class FormFields extends StatefulWidget {
  const FormFields({super.key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    TextEditingController usernameController =TextEditingController();
    TextEditingController passwordController =TextEditingController();
    final _storage = FlutterSecureStorage();
    Future<void> _readTokens() async {
      try {
        final accessToken = await _storage.read(key: 'access');
        final refreshToken = await _storage.read(key: 'refresh');

        if (accessToken != null && refreshToken != null) {
          print('Access Token: $accessToken');
          print('Refresh Token: $refreshToken');
        } else {
          print('No tokens found');
        }
      } catch (e) {
        print('Error occurred while reading tokens: $e');
      }
    }
    Future<void> _login() async {
      try {
        final response = await http.post(
          Uri.parse('http://10.182.2.189:8888/login/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': usernameController.text,
            'password': passwordController.text,
          }),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          await _storage.write(key: 'access', value: responseData['access']);
          await _storage.write(key: 'refresh', value: responseData['refresh']);
          print('Login successful');
          await _readTokens();
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BeatLoggedIn()),
          );

      } else {
          print('Login failed');
          print('Failed with status code: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } catch (e) {
        print('Error occurred: $e');
      }
    }

    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter username',
              fillColor: Color(0xFFAFCBDE),
              prefixIcon: Icon( Icons.phone_callback_rounded,
                color: Colors.black,
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blueGrey ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value){
              print(value);


            },
            validator:(value){
              if (value == null || value.isEmpty) {
                return 'User Name is required';
              }
              if (value.length <5)
              {
                return 'Invalid user name';
              }
              return null;},
          ),
          SizedBox( height: 20),
          TextFormField(
            // requires obscurre text; baad ma
            controller: passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter password',
              fillColor: Color(0xFFAFCBDE),
              prefixIcon: Icon( Icons.phone_callback_rounded,
                color: Colors.black,
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blueGrey ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value){
              print(value);


            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              RegExp regex = RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:"<>?]).{5,}$');
              if (value.length<=3 || !regex.hasMatch(value)) {
                return 'Password must be valid';
              }
              return null;
            },
          ),
          SizedBox( height: 20),
          ElevatedButton(
            onPressed: () async{
              if(_formkey.currentState!.validate()){
                _login();
              }

            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),

              ),
              elevation: 8.0,
              shadowColor: Colors.black,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Captcha extends StatelessWidget {
  const Captcha({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Captcha here');
  }
}

class SucessMessage extends StatelessWidget {
  const SucessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Details have been added!'),
        ),
      );
    });

    return Scaffold(
      body: SizedBox.shrink(), // Empty widget
    );
  }
}