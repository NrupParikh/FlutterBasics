import 'package:first_flutter_application/content.dart';
import 'package:first_flutter_application/l10n/l10n.dart';
import 'package:first_flutter_application/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> languageList = ['en', 'hi', 'ar'];
final ValueNotifier<String> _selectedValue = ValueNotifier<String>('');
ValueNotifier<Locale> _currentLocale =
    ValueNotifier<Locale>(const Locale('en', ''));

void main() {
  _selectedValue.value = languageList[0];
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: _currentLocale,
      builder: (BuildContext context, Locale value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Other properties...
          locale: value,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
              textTheme:
                  GoogleFonts.oxygenTextTheme(Theme.of(context).textTheme)),
          theme: ThemeData.light(useMaterial3: true).copyWith(
              textTheme:
                  GoogleFonts.actorTextTheme(Theme.of(context).textTheme)),
          supportedLocales: L10n.all,
          home: const MyHomePage(),
        );
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // For dropdown
  var dropdownValue = languageList.first;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _loadFirstScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FirstScreen()));
  }

  void _loadContent() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Content()));
  }

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Nrup";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
            "${AppLocalizations.of(context)!.learnFlutterIn} $days ${AppLocalizations.of(context)!.daysWith} $name ${AppLocalizations.of(context)!.person}"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).colorScheme.primary),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                value: dropdownValue,
                items:
                    languageList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    _selectedValue.value = newValue!;
                    _currentLocale.value = Locale(newValue);
                  });
                },
              ),
            ),
            const SizedBox(height: 50,),
            Text('${AppLocalizations.of(context)!.selectedLanguage} ${_selectedValue.value}',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 10,),
            Text(
              "${AppLocalizations.of(context)?.counterValue}",
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                  fontSize: 32, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
                onPressed: _loadFirstScreen,
                child: Text("${AppLocalizations.of(context)?.goNextScreen}")),
            const SizedBox(height: 50,),
            ElevatedButton(
                onPressed: _loadContent,
                child: Text("${AppLocalizations.of(context)?.goAlbumScreen}"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _selectedValue.dispose();
    super.dispose();
  }
}
