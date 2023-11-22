import 'package:flutter/material.dart';
import 'package:smaple_projectt/newwww.dart';
import 'package:sqflite/sqflite.dart';

class MyPage extends StatefulWidget{

  @override

  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage>{
  List<Task> tasks=[];
  final dbHelper=DatabaseHelper();

  @override
  void initState() {
    super.initState();
    refreshTasks();
  }

  void refreshTasks() async {
    List<Task> _tasks = await dbHelper.getAllTasks();
    setState(() {
      tasks = _tasks;
    });
  }

  _showDialog({Task? task}) {
    print("Dbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    print(dbHelper);
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
                  await dbHelper.InsertTask(newTask);
                } else {
                  // Update Task
                  Task updatedTask = Task(
                    id: task.id,
                    title: titleController.text,
                    completed: task.completed,
                  );
                  await dbHelper.updateTask(updatedTask);
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('CRUD'),),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context,index){
            Task task = tasks[index];
            return ListTile(
              leading: Checkbox(
                value: task.completed,
                onChanged: (value) async{
                  Task updatedTask=Task(
                    id:task.id,
                    title: task.title,
                    completed: value!,
                  );

                  await dbHelper.updateTask(updatedTask);
                  refreshTasks();
                },
                activeColor: Colors.green,
              ),
              title: Text(task.title),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed:(){_showDialog(task:task);}, icon: Icon(Icons.update)),
                  IconButton(onPressed: ()async{
                    await dbHelper.deleteTask(task.id!);
                    refreshTasks();
                  }, icon: Icon(Icons.delete))
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showDialog,
      ),
    );

  }
}




