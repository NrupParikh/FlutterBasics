# FlutterBasics

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
- All Dependencies are defined here

### Dart Language

- Object Oriented Language
- Developed by Google in 2011
- C-style syntex
- Strongly Typed
- First code compile and execute into machine code

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
- Framework to add material design elements like , AppBar, Floating Action Buttons, Drawers

### Stack
- Used for overlapping a widget

 
## Types of Layout Widgets

### Single Child Widget
- can have only one child widget inside the parent layout widget
- Ex. Container, Padding, Center, Align, SizedBox, AspecRatio, Baseline, ConstrainedBox, FittedBox

### Multiple Child Widget
- can have multiple child widget inside the parent layout widget
- Ex. Row and Column, ListView, GridView, Expanded, Table, Flow, Stack

### setState()
- This method tells Flutter framework that something has changed in this state.
- It call the build() so, UI will be change as per state change.
- For example, If you have int _counter = 0 variable and on Button click you want to update the _counter, you have to write  _counter++ in the setState(). So, It call the build() and update the UI with new state ( From 0 to 1 and so on.. )

-----
#### Q:  Do I have to write seperate code for Android and IOS for just getting Native look and feel of any widget like, TextField or Button in Flutter ?

- No, Flutter achieves a native look and feel by using its own set of widgets that closely mimic the platform-specific widgets on Android and iOS. 
-  It uses Skia, a 2D rendering engine, to draw the widgets on the screen, ensuring that they look native on each platform.

-----
## Dart

- Dart is strongly typed language
- Dart is combination of Java and JS
- Constant
- final

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
