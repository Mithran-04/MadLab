import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Task {
  int? id;
  String title;
  bool completed;

  Task({this.id,required this.title,required this.completed});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'completed': completed ? 1 : 0};
  }
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, initialize it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    // Get the document directory path on the device
    String path = join(await getDatabasesPath(), 'tasks.db');

    // Open the database at a given path
    return openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        completed INTEGER
      )
    ''');
  }

  Future<int> insertTask(Task task) async {
    Database db = await database;
    return await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getAllTasks() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        title: maps[index]['title'],
        completed: maps[index]['completed'] == 1 ? true : false,
      );
    });
  }

  Future<int> updateTask(Task task) async {
    Database db = await database;
    return await db.update('tasks', task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async {
    Database db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}