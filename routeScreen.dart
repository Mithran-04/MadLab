import 'package:flutter/material.dart';
import 'package:smaple_projectt/newwww.dart';
import 'newSqlUi.dart';
class routeScreen extends StatefulWidget{
  final Function() refresh;
  routeScreen({super.key,required this.refresh});
  static const routeName = '/newwwww';
  @override
  State<routeScreen> createState()=> _routeScreenState();
}

class _routeScreenState extends State<routeScreen>{
  final dbHelper=DatabaseHelper();
  @override
  _showDialog() {

    TextEditingController titleController =
    TextEditingController(text:"");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Task'),
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
                  // Add Task
                  Task newTask =
                  Task(title: titleController.text, completed: false);
                  await dbHelper.InsertTask(newTask);
                  widget.refresh();
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
      appBar: AppBar(title: Text('Screen'),
      ),
      body: IconButton(
        icon: Icon(Icons.add),
        onPressed:() {
          _showDialog();

          // Navigator.of(context).pop();
        },
      ),
    );
  }}