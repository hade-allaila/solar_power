import 'package:sqflite/sqflite.dart';

class AvaliableLoadpinsDatabaseHelper {
  static final AvaliableLoadpinsDatabaseHelper instance =
      AvaliableLoadpinsDatabaseHelper._init();
  AvaliableLoadpinsDatabaseHelper._init();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('loads.db');
      return _database!;
    }
  }

  String tableName = "loadpins";
  int version = 1;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    String path = "$dbPath/$filePath";
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
      'CREATE TABLE $tableName (name TEXT PRIMARY KEY, value INTEGER, state INTEGER)',
    );
    var batch = db.batch();
    batch.insert(tableName, {"name": "1", "value": 16, "state": 1});
    batch.insert(tableName, {"name": "2", "value": 17, "state": 1});
    batch.insert(tableName, {"name": "3", "value": 18, "state": 1});
    batch.insert(tableName, {"name": "4", "value": 19, "state": 1});
    batch.insert(tableName, {"name": "5", "value": 21, "state": 1});
    batch.insert(tableName, {"name": "6", "value": 22, "state": 1});
    batch.insert(tableName, {"name": "7", "value": 23, "state": 1});
    // batch.insert(tableName, {"name": "8", "value": 33, "state": 1});
    await batch.commit();
  }

  Future<List<Map<String, Object?>>> getAvaliablePins() async {
    var db = await database;
    var query = await db.query(
      tableName,
      columns: ['name', "value"],
      where: "state = ?",
      whereArgs: [1],
    );
    return query;
  }

  Future<void> togglePinState(int value, int state) async {
    var db = await database;
    await db.update(
      tableName,
      {"state": state},
      where: "value=?",
      whereArgs: [value],
    );
  }
}
