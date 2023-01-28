import 'package:flutter/material.dart';  // importing Material library from Flutter
//importing several dart files that are needed for the application
import 'package:todo_app_mobile/widgets/my_header_drawer.dart';
import 'all_tasks.dart';
import 'create_task.dart';
 
// creating a stateful widget for the home screen of the app
class HomeScreen extends StatefulWidget {
 
  //creating an instance of the _HomeScreenState class to maintain state and rebuild the widget when necessary
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 
// defining a class used to rebuild the HomeScreen widget when the state changes
class _HomeScreenState extends State<HomeScreen> {
 
  //defining variable used to determine which page to show in the body of the Scaffold widget, 
  //and initializing it to the landing page.
  var currentPage = DrawerSections.tasks;
 
  //defining build method
  @override
  Widget build(BuildContext context) {
    //variable that holds content of a current page being displayed
    var container;
 
    //Defining what page to display according to the option selected in the side menu(drawer)
    if (currentPage == DrawerSections.tasks) {
      container = AllTasksPage();
    } else {
      container = CreateTaskPage();
    }
 
    // returning scaffold widget that defines the layout of the page
    return Scaffold(
      backgroundColor: Colors.white, // background color of the app page
      floatingActionButton: currentPage == DrawerSections.new_task  
          // checks if the page is create task page and not display the floatActionButton
          ? null
          //otherwise it will display the floatActionButton
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  //navigates to the create task page
                  currentPage = DrawerSections.new_task;
                });
              },
              backgroundColor: Color(0xFF476EBE),
              child: Icon(Icons.add),
            ),
      appBar: AppBar(
        backgroundColor: Colors.white,  // defining background color of the app bar
        title: Text("ToDo",style: TextStyle(color: Color(0xFF476EBE)),), // title in the app bar
        centerTitle: true, // centering the text in the app bar
        elevation: 0,      // removing the shadow from the app bar
        actions: [
          // a popup menu in the app bar
          PopupMenuButton(
              itemBuilder: (context) => [
                // list on menu items each with an icon and label
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(Icons.person), 
                        PopupMenuItem(child: Text("Profile")),
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(Icons.dark_mode), 
                        PopupMenuItem(child: Text("Dark mode")),
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(Icons.settings), 
                        PopupMenuItem(child: Text("Settings")),
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(Icons.logout), 
                        PopupMenuItem(child: Text("Logout")),
                      ],
                    )),
                  ])
        ],
      ),
      body: container, // initializing the app body with the content of the current page being displayed
 
      //defining the app drawer widget
      drawer: Drawer(
          child: SingleChildScrollView( // a single child scrollable widget that can scroll only vertically
        child: Container( // container widget that holds content of side panel
          child: Column(children: [  // content of the container is organised in a column widget
            MyHeaderDrawer(),    // custom widget that holds the header of app drawer
            MyDrawerList(),      // custom widget that holds drawer's list of options 
          ]),
        ),
      )),
    );
  }
 
// defining custom widget that holds drawer's list of options
  Widget MyDrawerList() {
 
    // container that holds drawer menu items in a column
    return Container(
      // giving the container a top padding
      padding: EdgeInsets.only(
        top: 15,
      ), 
      child: Column(  // widget that holds drawer menu items in a column
        // defining drawer menu items
        children: [
          // calling the menuItem class and passing to it the id, name, and icon of the drawer menu item and a boolean 
          // specifying whether the menuItem is the current page 
          menuItem(1, "All Tasks", Icons.checklist,
              currentPage == DrawerSections.tasks ? true : false),
          menuItem(2, "Create Task", Icons.add_task,
              currentPage == DrawerSections.new_task ? true : false),
        ],
      ),
    );
  }
 
// defining custom widget that creates the drawer menu item
  Widget menuItem(int id, String title, IconData icon, bool selected) {
 
    // returning a material widget to allow material design interactions like tapping on a menu item
    return Material(
      // defining background color for when menu item is selected and otherwise
        color: selected ? Colors.grey[300] : Colors.transparent, 
        // inkwell widget to be able to click on a menu item
        child: InkWell(
          onTap: () {
            //When tapped, it pops the current context
            Navigator.pop(context);
            //It also sets the state of the currentPage variable to the corresponding page based on the id passed in 
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.tasks;
              } else {
                currentPage = DrawerSections.new_task;
              }
            });
          },
 
          // giving menu item a top,left,bottom,and right padding
          child: Padding(
              padding: EdgeInsets.all(15.0),
              // organising menu items in a row
              child: Row(
                children: [
                  // expanded widget that contains icon of the menu item
                  Expanded(
                    child: Icon(
                      icon, // icon passed to the menuItem class
                      size: 20, // defining size
                      color: Colors.black, // defining the color of icon
                    ),
                  ),
 
                  // expanded widget that contains text of the menu item
                  Expanded(
                      flex: 3, // defining space took up by text in the row
                      child: Text(
                        title,  // title passed to the menuItem class
                        style: TextStyle(  // defining text style
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ))
                ],
              )),
        ));
  }
}
 
 
// enum that holds drawer menu items which will be used to track the displayed page according to the selected menu Item
enum DrawerSections {
  tasks,
  new_task,
}