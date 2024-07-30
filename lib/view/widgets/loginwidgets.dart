//all the widgets of loginpage
import 'package:flutter/material.dart';
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
            height: screenSize.height * 0.4,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FormFields(),
                ),
                Captcha(),
                LoginButton(),
              ],
            ),

          ),

        ],
      ),


    );
  }
}
class FormFields extends StatelessWidget {
  const FormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    TextEditingController phonenumberController =TextEditingController();
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: phonenumberController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Phonenumber',
              hintText: 'Enter phone number',
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
              //_dataToSend['phonenumber'] = value;

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


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
        child: Text('Login'));
  }
}
