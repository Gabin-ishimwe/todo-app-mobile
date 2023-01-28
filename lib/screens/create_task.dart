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
      physics: const BouncingScrollPhysics(),
      child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Add New Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Title", border: OutlineInputBorder()),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Description", border: OutlineInputBorder()),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
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
                      const Text(
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
                      const Text(
                        "Not Completed",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
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
                    thumbColor: Color(0xFF476EBE),
                    activeColor: Color(0xFF476EBE),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Color(0xFF476EBE)),
                child: const Text("Add new task"),
              )
            ],
          )),
    ));
  }
}
