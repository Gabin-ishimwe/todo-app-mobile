import 'package:flutter/material.dart'; // importing Material library from Flutter
 
// creating a stateful widget for the app drawer header
class MyHeaderDrawer extends StatefulWidget {
  //creating an instance of the _MyHeaderDrawerState class to maintain state and rebuild the widget when necessary
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}
 
// defining a class used to rebuild the drawer header widget when the state changes
class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
 
  //defining build method
  @override
  Widget build(BuildContext context) {
 
    // container widget that holds items of drawer header
    return Container(
      color: Color(0xFF476EBE),  // background header
      width: double.infinity,      // defining width
      height: 200,                 // defining height
      padding: EdgeInsets.only(top: 20.0), // defining top padding of the header
      child: Column( // organizing header items in a column
        mainAxisAlignment: MainAxisAlignment.center, // aligning items at the center of the column
        children: [
          Container(  //container widget to hold user image
            margin: EdgeInsets.only(bottom: 10), // bottom margin
            height: 70, // defining container height
            decoration: BoxDecoration( // widget for styling the container
              shape: BoxShape.circle,  // making the container a circle
              image: DecorationImage(  // widget to allow us filling the circle with an image
                image: AssetImage('assets/images/profile.jpg'), // specifying image path
              ),
            ),
          ),
          Text( // child of column widget holding user name
            "John Doe",
            style: TextStyle(color: Colors.white, fontSize: 20), // styling user name
          ),
          Text( // child of column widget holding user email
            "johndoe@gmail.com",
            style: TextStyle(  // styling user email
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}