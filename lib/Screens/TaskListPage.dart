import 'package:flutter/material.dart';

import '../Model/Task Class.dart';
import '../Widgets/Task Card.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<TaskClass> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Task List", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[50],
        ),
        body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskCardTwo(
                taskName: taskList[index].taskName,
                taskDescription: taskList[index].taskDescription,
                taskDate: taskList[index].taskDate,
              index: index,);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            taskList.add(TaskClass(
                taskName: "Task Name",
                taskDescription: "This is a task description",
                taskDate: DateTime.now()));

            setState(() {

            });

            print(taskList);


          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
