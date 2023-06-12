import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

// Calling API for getting Album
// Future used for async operations
// Represents value or error that will be available at sometime in future
Future fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
  Map<String, dynamic> data = jsonDecode(response.body);
  var title = data["title"];
  print("Title is $title");
}

class _ListScreenState extends State<ListScreen> {
  // Call on Button click

  void _onPressed() {
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("List Screen",
              style: GoogleFonts.getFont('Cherry Cream Soda')),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Album List",
                    style: GoogleFonts.getFont('Cherry Cream Soda')),
              ),
              ElevatedButton(
                  onPressed: _onPressed,
                  child: Text("Call API",
                      style: GoogleFonts.getFont('Cherry Cream Soda')))
            ],
          ),
        ));
  }
}
