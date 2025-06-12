import 'package:jim_dedi/tugas_13/model/model_workout.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbWorkout {
  static Database? _db;

  static Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'workouts.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE workouts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          duration INTEGER,
          status TEXT
        )
      ''');
      },
    );
  }

  static Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  static Future<int> insertWorkout(Workout workout) async {
    final dbClient = await db;
    return dbClient.insert('workouts', workout.toMap());
  }

  static Future<List<Workout>> getAllWorkouts() async {
    final dbClient = await db;
    final result = await dbClient.query('workouts');
    return result.map((w) => Workout.fromMap(w)).toList();
  }

  static Future<int> updateWorkout(Workout workout) async {
    final dbClient = await db;
    return dbClient.update(
      'workouts',
      workout.toMap(),
      where: 'id = ?',
      whereArgs: [workout.id],
    );
  }

  static Future<int> deleteWorkout(int id) async {
    final dbClient = await db;
    return dbClient.delete('workouts', where: 'id = ?', whereArgs: [id]);
  }
}
