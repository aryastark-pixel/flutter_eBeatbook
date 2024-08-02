//page2 widget 2
//yet to implement crud here
import 'package:e_beatbook/services/apiservice/apicalls.dart';
import 'package:flutter/material.dart';

class HotelsForms extends StatefulWidget {
  const HotelsForms({super.key});

  @override
  State<HotelsForms> createState() => _HotelsFormsState();
}

class _HotelsFormsState extends State<HotelsForms> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String HotelName;
  late String HotelOwner;
  late String phonenumber;
  late String Remarks;

  TextEditingController hotelcontroller = TextEditingController();
  TextEditingController ownercontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController remarkscontroller = TextEditingController();
  Map<String, dynamic> _dataToSend = {
    'HotelName': '',
    'HotelOwner': '',
    'phonenumber': '',
    'Remarks': '',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.1),
      child: Form(
        key: _formkey,
        child: Expanded(
          child: Column(
            children: [
              TextFormField(
               controller: hotelcontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Hotel Name',
                  hintText: 'Enter name of Hotels/Restaurant',
                  fillColor: Color(0xFFAFCBDE),
                  prefixIcon: Icon(Icons.drive_file_rename_outline_rounded,
                    ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,  ),
                    borderRadius: BorderRadius.circular(30.0),),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),),),

                onChanged: (String value){
                  print(value);
                  _dataToSend['HotelName'] = value;
                  print(_dataToSend['HotelName']);


                },

                validator:(value){
                  if (value == null || value.isEmpty) {
                    return 'Hotel Name is required';
                  }
                  if (value.length <5)
                  {
                    return 'Invalid Hotel Name';
                  }
                  return null;},
              ),
              SizedBox(height: 23),
              TextFormField(
                controller: ownercontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Owner Name',
                  hintText: 'Enter the name of the owner',
                  fillColor: Color(0xFFAFCBDE),
                  prefixIcon: Icon(Icons.local_police_rounded,
                     ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, ),
                    borderRadius: BorderRadius.circular(30.0),),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),),),
                onChanged: (String value){
                  print(value);
                  _dataToSend['HotelOwner'] = value;
                },

                validator:(value){
                  if (value == null || value.isEmpty) {
                    return 'Owner Name is required';
                  }
                  return null;},),
              SizedBox(height: 23),
              TextFormField(
                controller: numbercontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Phonenumber',
                  hintText: 'Enter phone number of the owner',
                  fillColor: Color(0xFFAFCBDE),
                  prefixIcon: Icon( Icons.phone_callback_rounded,
                   // color: anotherColor,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (String value){
                  print(value);
                  _dataToSend['phonenumber'] = value;

                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phonenumber is required';
                  }
                  RegExp regex = RegExp(r'^[0-9]{10}$');
                  if (!regex.hasMatch(value)) {
                    return 'Phone number must be a 10-digit number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              TextFormField(
                controller: remarkscontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Your Remarks',
                  hintText: 'Your Remarks',
                  fillColor: Color(0xFFAFCBDE),
                  prefixIcon: Icon(Icons.drive_file_rename_outline_rounded,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,  ),
                    borderRadius: BorderRadius.circular(30.0),),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),),),

                onChanged: (String value){
                  print(value);
                  _dataToSend['Remarks'] = value;
                },

                validator:(value){
                  if (value == null || value.isEmpty) {
                    return 'Remarks is required';
                  }
                  if (value.length <5)
                  {
                    return 'Invalid Remark';
                  }
                  return null;},
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  if(_formkey.currentState!.validate()){
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Add Confirmation'),
                          content: Text(
                              'Are you sure you want to Add this item?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await posthotelData(_dataToSend);
                                ownercontroller.clear();
                                numbercontroller.clear();
                                remarkscontroller.clear();
                                hotelcontroller.clear();
                                Navigator.of(context).pop();
                              },
                              child: Text('Add'),
                            ),
                          ],
                        );
                      },
                    );
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
                    'ADD',
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
        ),
      ),
    );
  }
}
