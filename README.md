# Basics of Flutter

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
- In lib folder Main.dart used to do code
- main() used to start application

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

-----
#### Q:  Do I have to write seperate code for Android and IOS for just getting Native look and feel of any widget like, TextField or Button in Flutter ?

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
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
  Map<String, dynamic> data = jsonDecode(response.body);
  return data["title"];
}
~~~

### References
-----
#### Image in Flutter
https://docs.flutter.dev/cookbook/images/network-image

#### Fonts in Flutter
https://docs.flutter.dev/cookbook/design/fonts#from-packages <br>
https://pub.dev/packages/google_fonts
