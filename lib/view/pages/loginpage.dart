//Loginpage aka homepage
//page1

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
      appBar: CustomAppbar(),
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
