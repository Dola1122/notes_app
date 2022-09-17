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
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE notes (
      id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      note TEXT NOT NULL,
      color TEXT NOT NULL
      )
      ''');

    await batch.commit();

    print("onCreate ========================================");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade ========================================");
  }

  deleteDb()async{
    String databasePath =
        await getDatabasesPath(); // الفانكشن دي بتحدد مسار افتراضي للداتابيس
    String path = join(databasePath, 'notes.db');
    deleteDatabase(path);
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
