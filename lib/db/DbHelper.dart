import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/DbModel.dart';

class DbHelper{

  static final DbHelper _instense=DbHelper.internal();
  factory DbHelper()=>_instense;
  Database _db;

  DbHelper.internal();

  Future<Database> createDB()async{
    if(_db!=null){

      return _db;
    }

    String path=join(await getDatabasesPath(),"Tasks.db");
    _db = await openDatabase(path,version: 1,onCreate: (db,version){
      db.execute("create table Tasks(id integer primary key autoincrement,name varchar(70),label varchar(200), description varchar(200), color varchar(200), date varchar(200)");
    },);
    print("db " + _db.path.toString());
    return _db;
  }

  Future<int> insert(DbModel task)async{
    Database database = await createDB();
    print("after create db");
    return database.insert("Tasks", task.toJson());
  }
  Future <List<Map<String,dynamic>>> select()async{
    Database db = await createDB();
    return db.query("Tasks");
  }

  Future<List<DbModel>> selectAll()async{
    Database db = await createDB();
    List<DbModel> tasks=[];
    for(var item in await db.query("Tasks")){
      tasks.add(DbModel.fromJson(item));
    }
    return tasks;
  }

}