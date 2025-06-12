import 'package:jim_dedi/tugas_13/model/model_login.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbLogin {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      version: 1,
      join(dbPath, 'work_out'),
      onCreate: (dbPath, version) {
        return dbPath.execute(
          "Create Table Users (id INTEGER PRIMARY KEY AUTOINCREMENT,email TEXT, name TEXT,username TEXT, password TEXT)",
        );
      },
    );
  }

  static Future<void> registerUser({ModelLogin? data}) async {
    final db = await initDB();

    await db.insert('users', {
      'username': data?.username,
      'email': data?.email,
      'password': data?.password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    ('User registered succesfully');
  }

  static Future<ModelLogin?> login(String email, String password) async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (data.isNotEmpty) {
      return ModelLogin.fromMap(data.first);
    } else {
      return null;
      // throw Exception("Invalid email or password");
    }
  }
}
