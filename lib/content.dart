import 'dart:convert';

import 'package:first_flutter_application/model/Album.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

// Calling API for getting Album
// Future used for async operations
// Represents value or error that will be available at sometime in future

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load Album");
  }
}

class _ContentState extends State<Content> {
  // Define album instance which we get in the future
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print("dispose");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Fetch Data from API",
              style: GoogleFonts.getFont('Cherry Cream Soda')),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!.title,
                  style:
                      const TextStyle(fontSize: 30, color: Colors.deepOrange),
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // Show loading until response comes
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
