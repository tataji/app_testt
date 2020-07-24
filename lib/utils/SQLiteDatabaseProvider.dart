import 'dart:async';
import 'dart:io';
import 'package:app_tesst/model/EmployeesModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class SQLiteDatabaseProvider {
  SQLiteDatabaseProvider._();
  static final String employeeTableName = "Employee";
  static final SQLiteDatabaseProvider db = SQLiteDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }
  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Employees.db");
    String createTableEmployee = "CREATE TABLE Employee ("
        "auto_id INTEGER primary key AUTOINCREMENT,"
        "id TEXT,"
        "first_name TEXT,"
        "last_name TEXT,"
        "gender TEXT,"
        "dob TEXT,"
        "email TEXT,"
        "phone TEXT,"
        "website TEXT,"
        "address TEXT,"
        "status TEXT"
        ")";
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(createTableEmployee);
        });

  }

  addEmployeeToDatabase(Employee result) async {
    final db = await database;
    var raw = await db.insert(
      employeeTableName,
      result.toMapForDb(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }
  Future<List<Employee>> getAllEmployeeListStoredLocalDb() async {
    final db = await database;
    var response = await db.query(employeeTableName);
    List<Employee> list =
    response.map((c) => Employee.fromJson(c)).toList();
    return list;
  }
  Future close() async => db.close();
}
