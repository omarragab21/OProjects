import 'package:sqflite/sqflite.dart';
   
import 'dart:io' as io;    
import 'package:path/path.dart';    
import 'package:path_provider/path_provider.dart';
import 'package:task/model/task.dart';

class DBHelper{
 static Database? _db;    
Future<Database> get db async {    
   if (_db != null) {    
     return _db!;    
   }    
   _db = await initDatabase();    
   return _db!;    
 }    
   
 initDatabase() async {    
   io.Directory documentDirectory = await getApplicationDocumentsDirectory();    
   String path = join(documentDirectory.path, 'todos.db');    
   var db = await openDatabase(path, version: 1, onCreate: _onCreate);    
   return db;    
 }    
    
 _onCreate(Database db, int version) async {    
   await db    
       .execute('CREATE TABLE taskss (id INTEGER PRIMARY KEY, title TEXT NOT NULL,time TEXT NOT NULL,date TEXT NOT NULL,status TEXT NOT NULL , isCompleted  INTEGER NOT NULL)');    
 }

 Future close() async {    
   var dbClient = await db;    
   dbClient.close();    
 }  
 Future<List<TaskModel>> getTasks() async {    
   var dbClient = await db;    
   List<Map> maps = await dbClient.query('taskss', columns: ['id', 'title','time','date','status','isCompleted']);    
   List<TaskModel> taskmodel = [];    
   if (maps.length > 0) {    
     for (int i = 0; i < maps.length; i++) {    
       taskmodel.add(TaskModel.fromJson(maps[i]));    
     }    
   }    
   return taskmodel;    
 }       

 Future<TaskModel> add(TaskModel taskModel) async {    
   var dbClient = await db;    
   taskModel.id = await dbClient.insert('taskss', taskModel.toMap());
   print('success');    
   return taskModel;    
 } 


  Future<int> delete(int id) async {    
   var dbClient = await db;    
   return await dbClient.delete(    
     'taskss',    
     where: 'id = ?',    
     whereArgs: [id],    
   );    
 } 

     
 Future<int> update(int id) async {    
   var dbClient = await db;    
   return await dbClient.rawUpdate('UPDATE taskss SET isCompleted = ?  WHERE id = ?',[1,id]);
 }

}




