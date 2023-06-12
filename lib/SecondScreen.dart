import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Second Screen"),
      ),
      body: SafeArea(
          child: Column(
        children: [

          // Load assets image
          const Image(image: AssetImage("assets/images/burger.jpg")),

          // Load Network Image [ GIF ]
          Image.network("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),

          // Go back screen
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Go back")),
        ],
      )),
    );
  }
}
