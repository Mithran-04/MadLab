import 'package:flutter/material.dart';
import 'package:smaple_projectt/sqliteDbHelper.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final dbHelper = DatabaseHelper();

  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    // refreshTasks();
  }

  // void refreshTasks() async {
  //   List<Task> _tasks = await dbHelper.getAllTasks();
  //   setState(() {
  //     tasks = _tasks;
  //   });
  // }
   void updateTask(int index,Task task){
    setState(() {

    });
   }

  _showDialog({Task? task}) {
    print("Dbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    // print(dbHelper);
    TextEditingController titleController =
    TextEditingController(text: task?.title ?? "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(task == null ? 'Add Task' : 'Update Task'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Task Title'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (task == null) {
                  // Add Task
                  Task newTask =
                  Task(title: titleController.text, completed: false);
                  tasks.add(newTask);
                  setState(() {

                  });
                  // await dbHelper.insertTask(newTask);
                } else {
                  // Update Task
                  Task updatedTask = Task(
                    id: task.id,
                    title: titleController.text,
                    completed: task.completed,
                  );
                  tasks[task.id]
                  // await dbHelper.updateTask(updatedTask);
                }

                refreshTasks();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite in Flutter'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return ListTile(
            leading: Checkbox(
              value: task.completed,
              onChanged: (value) async {
                Task updatedTask = Task(
                  id: task.id,
                  title: task.title,
                  completed: value!,
                );
                await dbHelper.updateTask(updatedTask);
                refreshTasks();
              },
              activeColor: Colors.green,
            ),
            title: Text(task.title),
            onTap: () {
              // Show Update Dialog on tap
              _showDialog(task: task);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    // Delete Task
                    await dbHelper.deleteTask(task.id!);
                    refreshTasks();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Show Update Dialog
                    _showDialog(task: task);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show Add Dialog
          _showDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}