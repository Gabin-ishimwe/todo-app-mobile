import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo Mobile App',
      // theme: new ThemeData(
      //   primarySwatch: Color(0xFFffffff),
      //   primaryTextTheme: TextTheme(
      //     headline6: TextStyle(
      //       color: Color(0xFF476EBE)
      //     )
      //   )
      // ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xFF476EBE)),
          foregroundColor: Colors.white, //<-- SEE HERE
        ),
      ),  
      home: HomeScreen(),
    );
  }
}
