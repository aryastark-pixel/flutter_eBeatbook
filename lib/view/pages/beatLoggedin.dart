// Logged in page of Beat Personnel
//page 2
import 'package:e_beatbook/view/widgets/loggedinWidgets.dart';
import 'package:e_beatbook/view/widgets/loginwidgets.dart';
import 'package:flutter/material.dart';
class BeatLoggedIn extends StatefulWidget {
  const BeatLoggedIn({super.key});

  @override
  State<BeatLoggedIn> createState() => _BeatLoggedInState();
}

class _BeatLoggedInState extends State<BeatLoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children :[
                    Text('Add details of Hotels/resturants', style:  TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              HotelsForms(),
            ]
          ),
        ),
      )
    );
  }
}
