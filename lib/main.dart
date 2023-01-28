import 'package:flutter/material.dart';  // importing Material library from Flutter
import 'screens/homeScreen.dart'; //importing dart file holding home screen of the app
 
// This is the main function where the program starts execution
void main() {
  // calling the runApp function, which takes in a widget as a parameter.
  runApp(const MyApp());
}
 
// creating a stateless widget as it will not hold any mutable state.
class MyApp extends StatelessWidget {
  // The class takes in a key as an optional parameter in the constructor.
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // The build method returns a MaterialApp widget, which is the root of the app's widget tree.
    return MaterialApp(
      debugShowCheckedModeBanner: false, //removing the debug banner from the app.
      title: 'Todo Mobile App',  // The title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, //primary color of the app 
        appBarTheme: AppBarTheme(  
          iconTheme: IconThemeData(color: Color(0xFF476EBE)), // defining color of the humburger menu icon
          foregroundColor: Colors.white, // setting the color of the text in the app bar to white
        ),
      ),  
      home: HomeScreen(), // the first screen that will be displayed when the app is launched.
    );
  }
}