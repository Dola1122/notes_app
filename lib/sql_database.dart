import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    return _db ??= await initialDb();
  }

  initialDb() async {
    String databasePath =
        await getDatabasesPath(); // الفانكشن دي بتحدد مسار افتراضي للداتابيس
    String path = join(databasePath, 'notes.db');
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
      id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      note TEXT NOT NULL
      )
      ''');
    print("onCreate ========================================");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade ========================================");
  }

  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
