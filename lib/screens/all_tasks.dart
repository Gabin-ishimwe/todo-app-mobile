import 'package:flutter/material.dart';

class Todo {
  String title;
  dynamic isCompleted;
  String description;
  int priority;
  Todo(this.title, this.isCompleted, this.description, this.priority);
}

class AllTasksPage extends StatefulWidget {
  @override
  _AllTasksPage createState() => _AllTasksPage();
}

class _AllTasksPage extends State<AllTasksPage> {
  // List<String> todos = [ 'Take out the trash' 'Buy groceries' 'Do laundry' ];
  List<Todo> todos = [
    Todo('Take out the trash', false, 'I will take out the trash', 4),
    Todo('Buy groceries', false, 'I will but groceries', 2),
    Todo('Do laundry', true, 'I will do the laundry', 1),
  ];
  bool? tapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[250],
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                          // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          elevation: 2,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            autofocus: false,
                            leading: Text(
                              todos[index].priority.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xFF476EBE),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              todos[index].title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              todos[index].description,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w200),
                            ),
                            trailing: Checkbox(
                              value: todos[index].isCompleted,
                              onChanged: (bool? value) {
                                setState(() {
                                  todos[index].isCompleted = value;
                                });
                              },
                            ),
                            selected: true,
                            onTap: () {
                              setState(() {
                                tapped = true;
                              });
                            },
                          )),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  );
                },
              ),
            )), //Padding
      ), //Center
    ); //SizedBox
  }
}
