import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class Task{
  String title;
  String desc;
  Task({required this.title,required this.desc});
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<Task> tasks=[];
  @override

  void _showEditDialog(String title,String desc,int index){
    TextEditingController titleCt=TextEditingController();
    TextEditingController descCt=TextEditingController();
    titleCt.text=title;
    descCt.text=desc;

    showDialog(context: context, builder:(context){
      return AlertDialog(
        title: Text("update"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCt,
              decoration: InputDecoration(
                  hintText: "Title"
              ),
            ),
            TextField(
              controller: descCt,
              decoration: InputDecoration(
                  hintText: "description"
              ),
            )
          ],

        ),

        actions: [
          TextButton(onPressed: (){
            Task newTask=Task(title:titleCt.text,desc:descCt.text);
            setState(() {
              tasks[index]=newTask;
            });
            Navigator.of(context).pop();
          }, child: Text("update")),

          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("cancel"))
        ],

      );
    });
  }


  void _showAddDialog(){
    TextEditingController titleCt=TextEditingController();
    TextEditingController descCt=TextEditingController();
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("add"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCt,
              decoration: InputDecoration(
                hintText: "Title"
              ),
            ),
            TextField(
              controller: descCt,
              decoration: InputDecoration(
                hintText: "description"
              ),
            )
          ],

        ),

        actions: [
          TextButton(onPressed: (){
            Task newTask=Task(title:titleCt.text,desc:descCt.text);
            setState(() {
              tasks.add(newTask);
            });
            Navigator.of(context).pop();
          }, child: Text("add")),

          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("cancel"))
        ],
      );
    });
  }

  void deleteTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }





  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Hello"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
          itemBuilder: (context,index){
          return ListTile(
            title: Text("${tasks[index].title}"),
            subtitle: Text(tasks[index].desc),
            trailing: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(onPressed: (){
                  _showEditDialog(tasks[index].title,tasks[index].desc,index);
                }, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){
                  deleteTask(index);
                }, icon: Icon(Icons.delete))
              ],
            ),
          );
          }
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){ _showAddDialog();
        setState(() {
          tasks=tasks;
        });},
      ),
    );
  }
}
