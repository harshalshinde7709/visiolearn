import 'package:educationapp/classacadamy.dart';
import 'package:educationapp/profile/reviews.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'login.dart';

dynamic db;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  db = openDatabase(
    join(await getDatabasesPath(),"a.db"),
    version: 1,
    onCreate: (db, version) async{
      await db.execute(
        '''
          CREATE TABLE userInfo(
            userName TEXT PRIMARY KEY,
            password TEXT,
            name TEXT,
            emailId TEXT
          )
        '''
      );
      await db.execute(
        '''
          CREATE TABLE userReviews(
            userName TEXT PRIMARY KEY,
            reviews TEXT,
            starCount INTEGER
          )
        '''
      );
      await db.execute(
        '''
          CREATE TABLE coursesList(
            courseId INTEGER PRIMARY KEY,
            courseName TEXT,
            batch1 TEXT,
            batch2 TEXT,
            batch3 TEXT,
            batch4 TEXT,
            img TEXT,
            amount INT
          )
        '''
      );
      await db.execute(
        '''
          CREATE TABLE userCourses(
            myCourseId INTEGER PRIMARY KEY,
            userName TEXT,
            courseId INT
          )
        '''
      );
    },
  );
  getMyCourseData();
  getCourseData();
  getReviewData();
  getUserData();
  runApp(const MainApp());
}

Future insertData(String tableName,dynamic obj)async{
  Database localdb = await db;

  localdb.insert(
    tableName,
    obj.retMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  //print(obj);
}

Future deleteData(String tableName,String where,List whereargs,dynamic obj)async{
  Database localdb = await db;

  localdb.delete(
    tableName,
    where: where,
    whereArgs: whereargs
  );
}

Future updateData(String tableName,String where,List whereargs,dynamic obj)async{
  Database localdb = await db;

  localdb.update(
    tableName,
    obj.retMap(),
    where: where,
    whereArgs: whereargs
  );
  //print(obj);
}

Future<List<Map<String,dynamic>>> getData(String tableName)async{
  Database localdb = await db;

  List<Map<String,dynamic>> lst = await localdb.query(tableName);

  //print("getData");
  
  return lst;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}