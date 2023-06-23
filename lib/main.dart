import 'package:first_flutter_application/content.dart';
import 'package:first_flutter_application/l10n/l10n.dart';
import 'package:first_flutter_application/first_screen.dart';
import 'package:first_flutter_application/utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

const List<String> languageList = ['en', 'hi', 'ar'];
final ValueNotifier<String> _selectedValue = ValueNotifier<String>('');

bool _isEnglishSelected = false;
bool _isHindiSelected = false;
bool _isArabicSelected = false;

ValueNotifier<Locale> _currentLocale =
    ValueNotifier<Locale>(const Locale('en', ''));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _selectedValue.value = languageList[0];

  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: _currentLocale,
      builder: (BuildContext context, Locale value, Widget? child) {
        var languageCode = Provider.of<ThemeProvider>(context)
            .currentLocal
            .languageCode
            .toString()
            .split(".")[1];

        print("LANGUAGE_CODE $languageCode");

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Other properties...
          locale: Locale(languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: Provider.of<ThemeProvider>(context).currentTheme,
          supportedLocales: L10n.all,
          // darkTheme: ThemeData.dark(useMaterial3: true).copyWith(

          //     textTheme:
          //         GoogleFonts.oxygenTextTheme(Theme.of(context).textTheme)),
          // theme: ThemeData.light(useMaterial3: true).copyWith(
          //     textTheme:
          //         GoogleFonts.actorTextTheme(Theme.of(context).textTheme)),

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
  // var dropdownValue = languageList.first;

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
        actions: [
          IconButton(
              onPressed: () {
                context.read<ThemeProvider>().changeCurrentTheme(context);
              },
              icon: context.watch<ThemeProvider>().currentTheme ==
                      ThemeData.light(useMaterial3: true)
                  ? const Icon(
                      Icons.dark_mode,
                      color: Colors.black54,
                    )
                  : const Icon(
                      Icons.light_mode,
                      color: Colors.yellow,
                    ))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_isEnglishSelected) {
                      _isEnglishSelected = false;
                    } else {
                      _isEnglishSelected = true;
                      _isHindiSelected = false;
                      _isArabicSelected = false;

                      // Set English Language
                      context
                          .read<ThemeProvider>()
                          .changeCurrentLocal(context, "en");
                      _currentLocale.value = const Locale("en");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .msgEnglishSelected)));
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _isEnglishSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                            image: AssetImage("assets/images/england.png")),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    if (_isHindiSelected) {
                      _isHindiSelected = false;
                    } else {
                      _isEnglishSelected = false;
                      _isHindiSelected = true;
                      _isArabicSelected = false;

                      // Set English Language
                      context
                          .read<ThemeProvider>()
                          .changeCurrentLocal(context, "hi");
                      _currentLocale.value = const Locale("hi");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              AppLocalizations.of(context)!.msgHindiSelected)));
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _isHindiSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Image(image: AssetImage("assets/images/india.png")),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    if (_isArabicSelected) {
                      _isArabicSelected = false;
                    } else {
                      _isEnglishSelected = false;
                      _isHindiSelected = false;
                      _isArabicSelected = true;

                      // Set English Language
                      context
                          .read<ThemeProvider>()
                          .changeCurrentLocal(context, "ar");
                      _currentLocale.value = const Locale("ar");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .msgArabicSelected)));
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _isArabicSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Image(image: AssetImage("assets/images/uae.png")),
                      )),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DropdownButton<String>(
            //     icon: const Icon(Icons.arrow_downward),
            //     elevation: 16,
            //     style: TextStyle(
            //         fontSize: 20, color: Theme.of(context).colorScheme.primary),
            //     underline: Container(
            //       height: 2,
            //       color: Colors.deepPurpleAccent,
            //     ),
            //     value: dropdownValue,
            //     items:
            //         languageList.map<DropdownMenuItem<String>>((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(
            //           value,
            //         ),
            //       );
            //     }).toList(),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         context
            //             .read<ThemeProvider>()
            //             .changeCurrentLocal(context, newValue!);
            //         dropdownValue = newValue!;
            //         _selectedValue.value = newValue;
            //         _currentLocale.value = Locale(newValue);
            //       });
            //     },
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Text(
            //     '${AppLocalizations.of(context)!.selectedLanguage} ${_selectedValue.value}',
            //     style: TextStyle(
            //         fontSize: 20,
            //         color: Theme.of(context).colorScheme.primary)),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _loadFirstScreen,
                child: Text("${AppLocalizations.of(context)?.goNextScreen}")),
            const SizedBox(
              height: 20,
            ),
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
