// imports the material library to use Material widgets
import 'package:flutter/material.dart';

// a class for a task
class Todo {
  String title;
  dynamic isCompleted;
  String description;
  int priority;
  Todo(this.title, this.isCompleted, this.description, this.priority);
}

// AllTasksPage is a stateful widget that displays a list of tasks.
class AllTasksPage extends StatefulWidget {
  @override
  _AllTasksPage createState() => _AllTasksPage();
}

// _AllTasksPage is the state object for the AllTasksPage widget.
class _AllTasksPage extends State<AllTasksPage> {
  // A list of Todo objects to be displayed.
  List<Todo> todos = [
    Todo('Take out the trash', false, 'The trash bag is full.', 4),
    Todo('Buy groceries', false, 'I have to buy vegetables and fruits.', 2),
    Todo('Do laundry', true, 'The laundry basket is full.', 1),
  ];

  bool? tapped;

  @override
  Widget build(BuildContext context) {
    // The widget returns a container that wraps the screen content.
    return Container(
      color: Color.fromARGB(255, 248, 248, 248),
      // centers everything inside the container
      child: Center(
        // a container wrapper for the list of tasks
        child: Container(
          // add margin so that their is space between the screen edges and the tasks list
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          //display the tasks i.e. Todo objects in the list.
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              // return a column that streches and occupy the space available cross axis (horizontally)
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // each task is a card and the card wraps the list tile for each task
                  Card(
                      // adds a shadow to the card
                      elevation: 2,
                      color: Colors.white,
                      // makes the cards edges to be round
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // displays a task. 
                      child: ListTile(
                        autofocus: false,
                        // the widget displayed before the title of the task
                        leading: Text(
                          // converts the number to string
                          todos[index].priority.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xFF476EBE),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        // displays the title of the task
                        title: Text(
                          todos[index].title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        ),
                        // displays the description of the task
                        subtitle: Text(
                          todos[index].description,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11.0,
                              fontWeight: FontWeight.w200),
                        ),
                        // a widget to be displayed after the title and subtitle
                        trailing: Checkbox(
                          // a checkbox that shows if a task is completed or not
                          value: todos[index].isCompleted,
                          onChanged: (bool? value) {
                            setState(() {
                              todos[index].isCompleted = value;
                            });
                          },
                        ), 
                        // a function that defines what happens when the list tile is tapped
                        // for now since nothing happens. we only sets the variable tapped to be true
                        onTap: () {
                          setState(() {
                            tapped = true;
                          });
                        },
                      )),
                  // a size box that adds space after each task on the list
                  SizedBox(
                    height: 15,
                  )
                ],
              );
            },
          ),
        ),
      ), //Center
    ); //SizedBox
  }
}
