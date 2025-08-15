import 'package:solar_app/models/load_model.dart';
import 'package:sqflite/sqflite.dart';

class LoadDatabaseHelper {
  static final LoadDatabaseHelper instance = LoadDatabaseHelper._init();
  LoadDatabaseHelper._init();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('loads.db');
    return _database!;
  }

  String tableName = "load";
  int version = 1;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    String path = "$dbPath/$filePath";
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
      'CREATE TABLE $tableName (name TEXT PRIMARY KEY, pin INTEGER,priority INTEGER, operationPower INTEGER, minOnTime TEXT, maxOnTime TEXT, minOffTime Text, maxOffTime TEXT, image TEXT default null)',
    );
  }

  Future<String> getLoadImage(String loadName) async {
    Database db = await database;
    var load = await db.query(
      tableName,
      columns: ['image'],
      where: "name = ?",
      whereArgs: [loadName],
    );
    String loadImage = load.first['image'] as String;
    return loadImage;
  }

  void addLoad(LoadModel load) async {
    Database db = await database;
    db.insert(tableName, load.toMap());
  }

  Future<List<LoadModel>> diffLoads(List<LoadModel> loads) async {
    Database db = await database;
    List<String> loadNames = loads.map((e) => e.deviceName).toList();
    String whereArgsPlaceHolders = List.filled(loadNames.length, "?").join(',');
    String whereStat = "name NOT IN ($whereArgsPlaceHolders)";
    List<Map<String, Object?>> loaclLoads = await db.query(
      tableName,
      where: whereStat,
      whereArgs: loadNames,
    );
    // print(
    //   "+++++++++++++++++++++++++++ loads to be synced ++++++++++++++++++++++++++++",
    // );
    // print(loaclLoads);
    if (loaclLoads.isNotEmpty) {
      return loaclLoads.map((e) => LoadModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<void> syncReomteLoads(List<LoadModel> loads) async {
    if (loads.isEmpty) return;
    List<String> loadNames = loads.map((load) => load.deviceName).toList();
    String placeHolders = List.filled(loads.length, "?").join(',');
    final db = await database;
    List<Map<String, Object?>> existsingRecords = await db.query(
      tableName,
      where: "name IN ($placeHolders)",
      whereArgs: loadNames,
      columns: ['name'],
    );
    List<LoadModel> newLoadsToAdd = loads.where((load) {
      for (int i = 0; i < existsingRecords.length; i++) {
        if (existsingRecords[i]["name"] == load.deviceName) {
          return false;
        }
      }
      return true;
    }).toList();
    if (newLoadsToAdd.isNotEmpty) {
      final batch = db.batch();
      for (final load in newLoadsToAdd) {
        batch.insert(
          tableName,
          load.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      await batch.commit(noResult: true);
      // print("Successfully added new loads in a batch.");
    }
  }

  Future<void> deleteLoad(String loadName) async {
    var db = await database;
    db.delete(tableName, where: "name  = ?", whereArgs: [loadName]);
  }
}
