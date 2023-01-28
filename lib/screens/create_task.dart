// imports the material library to use Material widgets
import 'package:flutter/material.dart';

// an enum for the status of completeness of a task
enum Status { completed, not_completed }

// CreateTaskPage is a stateful widget that holds a page where the user can create a task
class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPage();
}

// _CreateTaskPage is the state object for the CreateTaskPage widget.
class _CreateTaskPage extends State<CreateTaskPage> {
  // instance of the Status enum
  Status? task_status;
  //a variable that will hold the priority that the user gives a task
  var priority = 0.0;

  // overrides the build function of a state object
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // adds margin to create space between the screen edges and the content
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // add the title on the page
              Text(
                "Add New Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // adds space between the title and the following text field
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              // a text field that receives user input for the title of the task
              TextField(
                decoration: InputDecoration(
                    labelText: "Title", border: OutlineInputBorder()),
              ),
              // adds space between the text fields
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              // a text field that receives user input for the description of the task
              TextField(
                decoration: InputDecoration(
                    labelText: "Description", border: OutlineInputBorder()),
              ),
              // adds space after the text field
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),

              // a column that holds the task status options
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // a label for the task status options
                  Text(
                    "Task status",
                    style: TextStyle(fontSize: 16),
                  ),
                  // a row for a task status option
                  Row(
                    children: [
                      // radio button for completed status option
                      Radio(
                        value: Status.completed,
                        groupValue: task_status,
                        onChanged: (val) {
                          setState(() {
                            // sets the value (task_status enum) of the status completeness to completed
                            task_status = val;
                          });
                        },
                      ),
                      // status option label
                      Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  // a row for a task status option
                  Row(
                    children: [
                      // radio button for completed status option
                      Radio(
                        value: Status.not_completed,
                        groupValue: task_status,
                        onChanged: (val) {
                          // sets the value (task_status enum) of the status completeness to not_completed
                          setState(() {
                            task_status = val;
                          });
                        },
                      ),
                      // status option label
                      Text(
                        "Not Completed",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              // adds a space after before the following column
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),

              // a column that holds the task priority slider
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // a label for the slider
                  Text(
                    "Task priority",
                    style: TextStyle(fontSize: 16),
                  ),

                  // a slider that will be used to specify the task priority
                  Slider(
                    value: priority,
                    onChanged: ((value) {
                      setState(() {
                        priority = value;
                      });
                    }),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: "$priority",
                    thumbColor: Color(0xFF476EBE),
                    activeColor: Color(0xFF476EBE),
                  ),
                ],
              ),
              // adds space before the button
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              // a button that is elevated i.e. has a shadow
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Color(0xFF476EBE)),
                child: const Text("Add new task"),
              )
            ],
          )),
    );
  }
}
