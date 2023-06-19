# Basics of Flutter

### Video of my work
----

https://github.com/NrupParikh/FlutterBasics/assets/108717119/4060206a-669b-454e-a66f-74c1b1c8b56f

----
### This repo contains

- Custom Application Icon for [ Android / WEB ]
- Custom font / Google Font support
- Loading Image from asset and from URL
- Navigation and data passing
- API calling
- Json Parsing
- Show data on UI
- Light and Dark Mode support
- Multi Language Support [English, Hindi, Arabic]
- RTL and LTR support
- Internationalization
- Drop down to change the Language

### Screens

- **main.dart** : Increment number on click of floating action button. Show Google Font in Appbar and Text,button
- **content.dart** : API calling, Json parssing and show quote on Text
- **second_screen.dart** : Load image from Asset and GIF from internet
- **album.dart** : Model class for getting album data

----

### Installation

- Download Flutter from
- https://docs.flutter.dev/get-started/install/windows

- Select flutter_windows_3.10.4-stable.zip
- Extract in F:/Flutter/SDK  Recommand not to install in C: drive)

### Set below configuration
- Environment Variable > User Variable
- F:\Flutter\SDK\flutter_sdk\flutter\bin
- And Install Flutter Plugin in Android Studio

### Run flutter doctor in Android Studio terminal
- flutter doctor
- F:\Flutter\SDK\flutter_sdk\flutter\bin
- F:\Flutter\SDK\flutter_windows_3.10.4-stable\flutter\bin

#### pubspec.yml
- Dependencies
- configurations
- assets and fonts are defined here

### Version Info
- run> flutter --version

```
Flutter 3.10.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 682aa387cf (3 days ago) • 2023-06-05 18:04:56 -0500
Engine • revision 2a3401c9bb                                            
Tools • Dart 3.0.3 • DevTools 2.23.1 
```

### Flutter Doctor
- run> flutter doctor

~~~
Flutter 3.10.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 682aa387cf (3 days ago) • 2023-06-05 18:04:56 -0500
Engine • revision 2a3401c9bb                                            
Tools • Dart 3.0.3 • DevTools 2.23.1                                    
    X Visual Studio not installed; this is necessary for Windows development.
      Download at https://visualstudio.microsoft.com/downloads/.
      Please install the "Desktop development with C++" workload, including all of its default components
[√] Android Studio (version 2022.1)
[√] Android Studio (version 2022.2)
[√] Connected device (4 available)
[√] Network resources
~~~

### Create Project
- run> flutter create MyFirstFlutterApp

### Running project
- run> flutter run

### Other commands while App already running
- r : Hot reload.
- R : Hot restart.
- h : List all available interactive commands.
- d : Detach (terminate "flutter run" but leave application running).
- c : Clear the screen
- q : Quit (terminate the application on the device).

### Where to do code?
- In lib folder main.dart used to do code
- main() used to start application

## Naming convention in Dart file
- In dart we follow the **snake** case
- Name source files using **lowercase_with_underscores**
- File save with .dart extension
- Ex. main.dart, second_screen.dart, album.dart
- But you can set Class name as Camel case. For e.g. class Album or class FirstScreen
- Reference : https://dart-lang.github.io/linter/lints/file_names.html

## Log in dart file
- Use **kDebugMode** when you use print()
- This will not create log when app is in production

~~~
import 'package:flutter/foundation.dart';

    if (kDebugMode) {
       print("Hello world");
    }
~~~

## Support Dark and Light Mode
- ThemeData.dark() : For Dark theme
- ThemeData.light() : For Light theme

~~~
// Support dark and light theme with changing app level font too.
// If dark theme then textTheme is oxygenTextTheme
// If light theme then textTheme is lobsterTextTheme

return MaterialApp(
      title: Constants.appTitle,
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          textTheme: GoogleFonts.oxygenTextTheme(Theme.of(context).textTheme)),
      theme: ThemeData.light(useMaterial3: true).copyWith(
          textTheme: GoogleFonts.lobsterTextTheme(Theme.of(context).textTheme)),
~~~

## Support Material3
- ThemeData.dark(useMaterial3: true)
- ThemeData.light(useMaterial3: true)
----
# Everything is widget

### Types of Widgets
- Visible - Output/Input : Text, Button, Image
- Invisible widgets : Layout and control : Row, Column

### For Row and Column
- mainAxisAlignment : If used in Column then it is Vertical alignment or Horizontal alignment
- crossAxisAlignment : If used in Column then it is Horizontal alignment or Vertical alignment

#### MainAxisAlignment have below values
- start
- end
- center
- spaceBetween
- spaceAround
- spaceEvenly

#### CrossAxisAlignment have below values
- start
- end
- center
- stretch
- baseline

### State Management Widget

### StatelessWidget
- build()
- No state info. Not change over the time
- Ex. Text, Row, Column, Container
- It is immutable. Means remain static throughout its lifecycle

### StatefulWidget
- createState()
- Has a state info. Change data over the time.
- Ex. Checkbox, Radio, TextField, Form,
- It is mutable. Means lieable to change.

### Scaffold
- Framework to add material design elements like , AppBar, Floating Action Buttons, Drawers, Bottom Sheets
- Actual content is in body block

### Stack
- Used for overlapping a widget


## Types of Layout Widgets

### Single Child Widget
- can have only one child widget inside the parent layout widget
- Ex. Container, Padding, Center, Align, SizedBox, AspecRatio, Baseline, ConstrainedBox, FittedBox

### Multiple Child Widget
- can have multiple child widget inside the parent layout widget
- Ex. Row, Column, Stack, ListView, GridView, Expanded, Table, Flow

### setState()
- This method tells Flutter framework that something has changed in this state.
- It call the build() so, UI will be change as per state change.
- For example, If you have int _counter = 0 variable and on Button click you want to update the _counter, you have to write  _counter++ in the setState(). So, It call the build() and update the UI with new state ( From 0 to 1 and so on.. )

**- The class that extends State has two methods**
  - initState() : Called at the time of widget is initialized
  - dispose() : Called when you go out of widget

~~~
 
 @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
~~~
-----
#### Q:  Do I have to write separate code for Android and IOS for just getting Native look and feel of any widget like, TextField or Button in Flutter ?

- No, Flutter achieves a native look and feel by using its own set of widgets that closely mimic the platform-specific widgets on Android and iOS.
-  It uses Skia, a 2D rendering engine, to draw the widgets on the screen, ensuring that they look native on each platform.

-----

### Dart Language

- Object Oriented Language
- Developed by Google in 2011
- Dart is combination of Java and JS
- C-style syntex
- Strongly Typed
- First code compile and execute into machine code
- Has constant and final variables

### Data Types

- Number : int and double
- Strings : UTF-16
- Boolean : True / False
- Records : Multiple objects into a single object.
- Lists
- Maps
- Runes : UTF-32. Ex. \u2665. Heart symbol
- Symbols : Object refers to an operator or identifier
- null

### Use of required keyword and default value in function
```
void main() {
   print(getInfo(number:25));
}

String getInfo({String name = "Nrup", required int number}){
  return "My name is $name and Roll number is $number";
}

// Output
My name is Nrup and Roll number is 25
```
## Navigation
-----

#### Navigation from One screen to other screen [ PUSH ]

```
 Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SecondScreen()));
```

### Navigate to back screen [ POP ]

```
 Navigator.of(context).pop()
```

### Working with Image
-----

### Show image from assets folder

- Create assets/images folder under the Project
- Add any images. Ex. burger.jpg

~~~
// Folder structure

FlutterApplication
 assets
   images
    burger.jpg
~~~

- Open pubspec.yml file
- Add below code to get access of images from assets/images folder

~~~
flutter: 
  assets:
     - assets/images/
~~~
- Now Load image in Image widget

~~~
Image(image: AssetImage("assets/images/burger.jpg"))
~~~

### Show image from URL

```
Image.network("https://picsum.photos/250")
```

### Show Gif Image

```
Image.network("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif")
```

### Working with Custom Fonts
-----

- In flutter we can set Google Font which reflact in all over our application
- This will reduce the application size as font load on the fly
- HTTP fetch the font run time. Which is ideal  for development
- For that we have to add dependecy in pubspec.yaml file

~~~
// Command to get Google Font dependecy
flutter pub add google_fonts

- You will see that google_fonts: ^5.0.0 added in pubspec.yaml file 

dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^5.0.0
~~~

- Now we have to set this font to whole our Theme for text
- Go to main.dart
- import below package

~~~
import 'package:google_fonts/google_fonts.dart';
~~~

- write below code for set Lobster Text Theme in whole application.
- You can change to latoTextTheme latter.

~~~
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
              textTheme: GoogleFonts.lobsterTextTheme(
          Theme.of(context).textTheme
        )
~~~

### Load font dynamically

~~~
import 'package:google_fonts/google_fonts.dart';

Text("Second Screen",  style: GoogleFonts.getFont('Lato')) // Remember to remove const if exist in the code.
~~~
- This will change the font to **Lato** even the **Text Theme** is set to **Lobster**

-----

### API Call in Flutter
- STEP 1 : Add the http package.
- STEP 2 : Make a network request using the http package.
- STEP 3 : Convert the response into a custom Dart object.
- STEP 4 : Fetch and display the data with Flutter.

### STEP 1 : Add the http package
- For that execute below command in terminal
~~~
flutter pub add http
~~~
- You can see that http: ^1.0.0  added in pubspec.yaml file

### STEP 2 : Make a network request using the http package
- **Future** used for **async** operations
- Represents value or error that will be available at sometime in future

~~~

// Without Model

import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
  Map<String, dynamic> data = jsonDecode(response.body);
  var title = data["title"];
  print("Title is $title");
}

// With Model

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load Album");
  }
}
~~~

### - STEP 3 : Convert the response into a custom Dart object.
- Create album.dart file

~~~

class Album {
  // Variables
  final int userId;
  final int id;
  final String title;

  // Constructor
  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  // fromJson
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userId: json["userId"], id: json["id"], title: json["title"]);
  }

  // toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userId"] = userId;
    data["id"] = id;
    data["title"] = title;
    return data;
  }
}
~~~

### - STEP 4 : Fetch and display the data with Flutter.
- Define album instance which we get in the future in class _ContentState

~~~
late Future<Album> futureAlbum;
~~~

- call futureAlbum = fetchAlbum(); in initState()

~~~
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load Album");
  }
}
~~~
- Display data on UI using FutureBuilder.
- Show loader until response comes.
~~~
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
~~~


### Language Support in Flutter
-----

- In pubspec.yaml add dependency for localization

~~~
flutter_localization: ^0.1.12
~~~

- Now under flutter: enable generate

~~~
  generate: true
~~~

- In your lib folder create l10n folder
- Now create l10n.dart file and put below code

~~~
import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale("en"),
    const Locale("ar"),
    const Locale("hi"),
  ];
}

~~~


-  Now add below line in build() of main.dart

~~~
return MaterialApp(
 supportedLocales: L10n.all,
)
~~~

- Now create l10n.yaml file under your project.
- Add below code
~~~
l10n.yaml

arb-dir: lib\l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
~~~

- Now create Json file for each language to support
  - app_en.arb : For English key and values
  - app_hi.arb : For Hindi key and values
  - app_ar.arb : For Arabic key and values

~~~
app_en.arb

{
  "appTitle": "Flutter Demo",
  "@appTitle": {
    "description": "Flutter Demo"
  },
}
 
app_hi.arb
 
{
  "appTitle": "Flutter डेमो",
}

app_ar.arb

{
  "appTitle": "عرض Flutter",
}  
~~~

- Run the application
  - It will generate language specific dart file when you run the app.
  - You can seen in dart_tool/flutter_gen/gen_l10n
    - app_localizations.dart
    - app_localizations_en.dart
    - app_localizations_hi.dart
    - app_localizations_ar.dart

- Now to support localization in dart file add below import

~~~
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

return MaterialApp(
 localizationsDelegates: AppLocalizations.localizationsDelegates,
)

~~~

- Now you can translate language specific text when you change local

~~~
Text("${AppLocalizations.of(context)!.title}")
~~~

### How to change Application Icon in flutter
----

- **For Android**
    - Add ic_launcher.png in
        - mipmap-mdpi [48x48]
        - mipmap-hdpi [72x72]
        - mipmap-xhdpi [96x96]
        - mipmap-xxhdpi [144x144]
        - mipmap-xxxhdpi [512x512]
        
    - This will change the Splash Screen Icon too. :)
    
- **For iOS**
    - Configure Info.plist
    - Open the ios/Runner/Info.plist
    - Replace the default icon entries with the filenames of your new icons. 

```
<key>CFBundleIconFile</key>
<string>AppIcon</string>
```

- **For Web**
    - project > lib > icons 
        - favicon-16x16.png
        - favicon-32x32.png
        - favicon-96x96.png
        - favicon-180x180.png
        - favicon-300x300.png
        - favicon-512x512.png

- Now web > manifest.json > icons array like

```
"icons": [
    {
      "src": "icons/favicon-16x16.png",
      "sizes": "16x16",
      "type": "image/png"
    },
    {
      "src": "icons/favicon-32x32.png",
      "sizes": "32x32",
      "type": "image/png"
    },
    {
      "src": "icons/favicon-96x96.png",
      "sizes": "96x96",
      "type": "image/png"
    },
    {
      "src": "icons/favicon-180x180.png",
      "sizes": "180x180",
      "type": "image/png"
    },
    {
      "src": "icons/favicon-300x300.png",
      "sizes": "300x300",
      "type": "image/png"
    },
    {
      "src": "icons/favicon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
```

### Which icon size suitable for what in web

- **16x16** : The size of browser favicons.
- **32x32** : The size of taskbar shortcut icons.
- **96x96** : The size of desktop shortcut icons.
- **180x180** : The size of Apple touch icons.
- **300x300** : The size required by Squarespace.
- **512x512** :The size required by WordPress.


### References
-----
#### Image in Flutter
https://docs.flutter.dev/cookbook/images/network-image

#### Fonts in Flutter
https://docs.flutter.dev/cookbook/design/fonts#from-packages <br>
https://pub.dev/packages/google_fonts

#### Internationalization and Localization in Flutter (i18n)
https://www.youtube.com/watch?v=sTGyufxPnUM
