import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'location_provider.dart';

class BeatbookEntry extends StatefulWidget {
  @override
  _BeatbookEntryState createState() => _BeatbookEntryState();
}

class _BeatbookEntryState extends State<BeatbookEntry> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> buttons = [];
  List<dynamic> filteredButtons = [];

  @override
  void initState() {
    super.initState();
    LocationService().startLocationService(); // Start location service
    fetchButtons();
    _searchController.addListener(_filterButtons);
  }

  @override
  void dispose() {
    _searchController.dispose();
    LocationService().stopLocationService(); // Stop location service
    super.dispose();
  }

  Future<void> fetchButtons() async {
    try {
      final response = await http.get(Uri.parse('http://10.182.2.184:8000/api/buttons/'));

      if (response.statusCode == 200) {
        setState(() {
          buttons = json.decode(response.body);
          filteredButtons = buttons;
        });
      } else {
        throw Exception('Failed to load buttons');
      }
    } catch (e) {
      print('Error fetching buttons: $e');
    }
  }

  void _filterButtons() {
    String searchTerm = _searchController.text.toLowerCase();
    if (searchTerm.isEmpty) {
      setState(() {
        filteredButtons = buttons;
      });
    } else {
      setState(() {
        filteredButtons = buttons.where((button) {
          return button['title'].toLowerCase().contains(searchTerm);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          automaticallyImplyLeading: true, // This will show the back button
          centerTitle: true, // Ensures that the title is centered
          title: Text(
            'New BeatBook Entry',
            style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
          ), // Your title text widget
          backgroundColor: Color(0xFFFF7F3E),
        ),

      ),
      body: Container(
        color: Color(0xFFFFF6E9),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(28),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 28,
                  childAspectRatio: 1,
                ),
                itemCount: filteredButtons.length,
                itemBuilder: (context, index) {
                  // String iconName = filteredButtons[index]['icon'];
                  return ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF80C4E9),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconData(int.parse(filteredButtons[index]['icon']), fontFamily: 'MaterialIcons'),
                            size: 55,
                          ),
                          SizedBox(height: 10),
                          Text(
                            filteredButtons[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
