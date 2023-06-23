import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("${AppLocalizations.of(context)?.titleSecondScreen}"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              // Load assets image
              const Image(image: AssetImage("assets/images/burger.jpg")),
              // Load Network Image [ GIF ]
              Image.network(
                  "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
              // Go back screen
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("${AppLocalizations.of(context)?.goBack}")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
