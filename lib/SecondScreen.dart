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
      body: Column(
        children: [
          // Load assets image
          const Image(image: AssetImage("assets/images/burger.jpg")),

          const Spacer(),

          // Load Network Image [ GIF ]
          Image.network(
              "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),

          // Gives twice the space between Middle and End than Begin and Middle
          const Spacer(flex: 2),

          // Go back screen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Go back")),
          ),
        ],
      ),
    );
  }
}
