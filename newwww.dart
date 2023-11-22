import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Task{
  int? id;
  bool completed;
  String title;
  Task({this.id,required this.title,required this.completed});
  Map<String,dynamic> toMap(){
    return {'id':id,'title':title,'completed':completed?1:0};
  }
}

class DatabaseHelper{
  static Database? _database;

  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database=await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async{
    String path=join(await getDatabasesPath(),'tasks.db');
    return openDatabase(path,version: 1,onCreate: _onCreateTable);

  }

  Future<void> _onCreateTable(Database db,int version) async{
        await db.execute('''
        create table tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title String,
        completed bool) ''');
  }

  Future<int> InsertTask(Task task) async{
    Database db=await database;
    return await db.insert('tasks',task.toMap());
  }

  Future<List<Task>> getAllTasks() async{
    Database db=await database;
    List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        title: maps[index]['title'],
        completed: maps[index]['completed'] == 1 ? true : false,
      );
    });
  }

  Future<int> updateTask(Task task) async{
    Database db=await database;
    return await db.update('tasks', task.toMap(),where: 'id=?',whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async{
    Database db=await database;
    return await db.delete('tasks',where: 'id=?',whereArgs: [id]);

}



}