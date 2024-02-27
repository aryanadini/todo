import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBManager{


  late Database _database;

  Future openDB() async {
    _database = await openDatabase(join(await getDatabasesPath(), "todo.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT,task TEXT,description TEXT)");
        });
  }
  Future<int> insertTodo(Todo todo) async {
    await openDB();
    return await _database.insert('todo', todo.toMap());

  }
  Future<List<Todo>> getTodoList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _database.query('todo');
    return List.generate(maps.length, (index) {
      return Todo(id: maps[index]['id'], task: maps[index]['task'], description: maps[index]['description'],

      );
    });
  }
  Future<int> updateTodo(Todo todo) async {
    await openDB();
    return await _database.update('todo', todo.toMap(), where: 'id=?', whereArgs: [todo.id]);
  }
  Future<void> deleteTodo(int? id) async {
    await openDB();
    await _database.delete("todo", where: "id = ? ", whereArgs: [id]);
  }

}
class Todo{
  int? id;
  late String task,description;
  Todo(  {this.id,required this.task,required this.description});
  Map<String,dynamic> toMap(){
    return{'task':task,'description':description};

  }

}