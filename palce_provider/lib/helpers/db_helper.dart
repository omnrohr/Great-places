import 'package:palce_provider/widgets/image_input_widget.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> conntectDatabase() async {
    final DBPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(DBPath, 'places.db'),
        onCreate: (db, version) => db.execute(
            'CREATE TEBLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT,)'),
        version: 1);
  }

  static Future<void> dbInsert({String table, Map<String, Object> data}) async {
    final DB = await conntectDatabase();
    DB.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object>>> getDBData(String table) async {
    final DB = await conntectDatabase();
    return DB.query(table);
  }
}
