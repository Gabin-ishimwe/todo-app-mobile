import 'package:flutter/material.dart';

enum Status { completed, not_completed }

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPage();
}

class _CreateTaskPage extends State<CreateTaskPage> {
  Status? task_status;
  var priority = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add New Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                decoration: InputDecoration(
                    labelText: "Title", border: OutlineInputBorder()),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                decoration: InputDecoration(
                    labelText: "Description", border: OutlineInputBorder()),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task status",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: Status.completed,
                        groupValue: task_status,
                        onChanged: (val) {
                          setState(() {
                            task_status = val;
                          });
                        },
                      ),
                      // Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                      Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: Status.not_completed,
                        groupValue: task_status,
                        onChanged: (val) {
                          setState(() {
                            task_status = val;
                          });
                        },
                      ),
                      // Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
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
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Task priority",
                    style: TextStyle(fontSize: 16),
                  ),
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
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add new task"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                ),
              )
            ],
          )),
    ));
  }
}
