import 'package:flutter/material.dart';
import 'package:todo_app_mobile/widgets/homeWidget.dart';
import 'package:todo_app_mobile/widgets/my_header_drawer.dart';
import 'all_tasks.dart';
import 'create_task.dart';

class HomeScreen extends StatefulWidget {
  // const HomePage({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.tasks;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.tasks) {
      container = AllTasksPage();
    } else {
      container = CreateTaskPage();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("ToDo",style: TextStyle(color: Color(0xFF476EBE)),),
        centerTitle: true,
        elevation: 0,
      ),
      body: container,
      drawer: Drawer(
          child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            MyHeaderDrawer(),
            MyDrawerList(),
          ]),
        ),
      )),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "All Tasks", Icons.checklist,
              currentPage == DrawerSections.tasks ? true : false),
          menuItem(2, "Create Task", Icons.add_task,
              currentPage == DrawerSections.new_task ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
        color: selected ? Colors.grey[300] : Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.tasks;
              } else {
                currentPage = DrawerSections.new_task;
              }
            });
          },
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Icon(
                      icon,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ))
                ],
              )),
        ));
  }
}



enum DrawerSections {
  tasks,
  new_task,
}
