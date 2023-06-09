# FlutterBasics

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
- mainAxisAlignment 
- crossAxisAlignment 

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
- For example, If you have counter variable and on Button click you want to update the counter, you have to counter++ in the setState(). So, It call the build() and update the UI with new state ( From 0 to 1 and so on.. )
 
