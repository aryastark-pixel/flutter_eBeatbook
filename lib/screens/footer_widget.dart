import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFF7F3E), // Footer color
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 50.0, // Adjust the height to be smaller
      child: Row(
        children: [
          Expanded(
            child: Image.asset('assets/digi.png'),
          ),
          Expanded(
            child: Image.asset('assets/nic.png'),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'Designed & Developed By NIC, Sikkim',
                style: TextStyle(color: Colors.white, fontSize: 12), // Adjust font size if needed
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
