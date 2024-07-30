//Loginpage aka homepage

import 'package:e_beatbook/view/widgets/loginwidgets.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Beat-Personnel Login',
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 24,
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
    );
  }
}
