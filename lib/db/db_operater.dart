import 'dart:async';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'class_infromation_db_model.dart';
import 'base_db_model.dart';

late Database localDB;

Future<void> openLocalDB() async {
  localDB = await openDatabase(
    join(await getDatabasesPath(), 'localDB.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE class_information(cursorId INTEGER, className TEXT, classTime TEXT, classColorType REAL)'
            // 'CREATE TABLE photo_information(cursorId INTEGER, photoPath TEXT, photoDescription TEXT)',
      );
    },
    version: 1,
  );
}

Future<void> insertInformation(BaseDBModel information, String tableName) async {
  await localDB.insert(
    tableName,
    information.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
Future<void> updateClassInformation(BaseDBModel information,String tableName, String identifyRow, var identifyInformation) async {
  await localDB.update(
    tableName,
    information.toMap(),
    where: '$identifyRow = ?',
    whereArgs: [identifyInformation],
  );
}

Future<void> deleteClassInformation(String tableName, String identifyRow, var identifyInformation) async {
  await localDB.delete(
    'tableName',
    where: '$identifyRow = ?',
    whereArgs: [identifyInformation],
  );
}
Future<int?> getMaxCursorId () async{
  return Sqflite.firstIntValue(await localDB.rawQuery('SELECT MAX(cursorId) FROM class_information'));
}

String convertMapToString(var selectTime){
  return jsonEncode(selectTime);
}

Map convertStringToMap(String jsonString){
  return jsonDecode(jsonString);
}

Future<List<ClassInformationDBModel>> getClassInformation() async {
  final List<Map<String, dynamic>> maps = await localDB.query('class_information');

  return List.generate(maps.length, (i) {
    return ClassInformationDBModel(
        cursorId: maps[i]['cursorId'],
        className: maps[i]['className'],
        classTime: maps[i]['classTime'],
        classColorType: maps[i]['classColorType']
    );
  });
}











